require "digest/sha1"
require "./tools/diff_util"

file_url = github_file_url("cimgui/imgui", "imgui_demo.cpp")
filename = File.join(Dir.tempdir, Digest::SHA1.hexdigest(file_url) + "_imgui_demo.cpp")

unless File.file?(filename)
  `g++ -fpreprocessed -dD -E cimgui/imgui/imgui_demo.cpp > #{Process.quote(filename)}` # Remove comments

  `clang-tidy #{Process.quote(filename)} -fix -fix-errors -checks="readability-braces-around-statements,readability-isolate-declaration" -- -Icimgui/imgui`

  `clang-format -i #{Process.quote(filename)} -style="{ColumnLimit: 0, PointerAlignment: Left, SpacesBeforeTrailingComments: 2, AlignTrailingComments: false, AllowShortFunctionsOnASingleLine: None, ContinuationIndentWidth: 2, AlignOperands: DontAlign, AlignAfterOpenBracket: DontAlign}"`
end

def nested_brackets_re(brackets = "([])")
  subs = (0...brackets.size//2).map do |i|
    "#{Regex.escape(brackets[i])}(?:(?>[^#{Regex.escape(brackets)}]*)|\\g<brack>)#{Regex.escape(brackets[-1 - i])}"
  end
  /(?<brack>#{subs.join('|')})/
end

static_names = Set(String).new

outp = [] of String

outp << "# Based on #{file_url}" << ""
outp << %(require "./imgui")
outp << %(require "./util") << ""
outp << "module ImGuiDemo"
outp << "  include ImGui::TopLevel"

def get_indent(line)
  line.size - line.lstrip.size
end

in_case = nil
in_macro = false

File.each_line(filename) do |fline|
  line = fline.lstrip
  indent = get_indent(fline)
  indent += 2 unless line.empty?

  line = line.gsub(/(ImGui::Begin\(")(?i:Dear ImGui)\b/, "\\1crystal-imgui")
  line = line.gsub(/\bimgui_demo\.cpp\b/, "src/demo.cr")

  guarded_strings = [] of String
  line = line.gsub(/"(.+?)"/) do
    s = $1.gsub(/(\\x[0-9a-f]{2})+/) do
      bytes = $0.scan(/[0-9a-f]{2}/).map do |m|
        m[0].to_u8(16)
      end
      String.new(bytes.to_unsafe.to_slice(bytes.size))
    end
    guarded_strings << s
    %("<STRING#{guarded_strings.size}>")
  end

  if line.starts_with?("#") || in_macro
    in_macro = line.ends_with?("\\")
    next
  end

  if !line.empty?
    line = line.gsub(/( +|^)\/\/.*/, "")
    next if line.empty?
  end
  line = line.gsub(/(?<=[^%][^%][^%])\b(\d+)\.?f\b/, "\\1f32")
  if line == "{"
    line = "begin"
  elsif line.in?("}", "};")
    line = "end"
  end
  line = line.gsub(/^for \(.+? (\w+) = (0); \1 < ([^& ]+); \1\+\+\) \{$/, "\\3.times do |\\1|")
  line = line.gsub(/^for \(.+? (\w+) = (0); \1 < ([^&]+); \1\+\+\) \{$/, "(\\3).times do |\\1|")
  line = line.gsub(/^for \(.+? (\w+) = (.+); \1 < ([^&]+); \1\+\+\) \{$/, "(\\2...\\3).each do |\\1|")
  line = line.gsub(/^for \(;;\) \{$/, "loop do")

  oldline = line
  line = line.gsub(/^case (.+): \{$/, "when \\1 then begin")
  line = line.gsub(/^case (.+):$/, "when \\1")
  line = line.gsub(/^switch \((.+)\) \{$/, "case \\1")
  if oldline != line
    in_case = indent
  end

  if in_case && line == "break;" && indent == in_case + 2
    in_case = nil
    next
  end

  line = line.gsub(/^(if|while) \((.+)\) \{$/, "\\1 \\2")
  line = line.gsub(/^struct (.+) \{$/, "class \\1")
  line = line.gsub(/^\} else if \((.+)\) \{$/, "elsif \\1")
  line = line.gsub(/^\} else \{$/, "else")

  line = line.gsub(/\B\(int\)\(([^(),;]*#{nested_brackets_re}?[^(),;]*)\)/, "(\\1).to_i")
  line = line.gsub(/\B\(int\)([^(),; ]+#{nested_brackets_re}?)/, "\\1.to_i")
  line = line.gsub(/\B\((int\*|unsigned int\*|float\*?|intptr_t\*?|void\*?)\)/, "")
  line = line.gsub(/\b&/, "")
  line = line.gsub(/&\(([^(),;]*#{nested_brackets_re}?[^(),;]*)\)/, "pointerof(\\1)")
  line = line.gsub(/&(\w[^(),;]*#{nested_brackets_re}?)/, "pointerof(\\1)")
  line = line.gsub(/->/, ".")
  line = line.gsub(/\.(\w+)/) do
    ".#{$1.underscore}"
  end
  line = line.gsub(/(\w+)\.\b/) do
    "#{$1.underscore}."
  end
  line = line.gsub(/"$/, "\" +")

  line = line.gsub(/\b(Im\w+)_(\w+)\b/, "\\1::\\2")
  line = line.gsub(/\bImVec([24])\(/, "ImVec\\1.new(")

  if line =~ /^char (\w+)\[(\d+)\];$/
    next
  end
  line = line.gsub(/\bchar (\w+)\[(\d+)\] = ""/, "char \\1 = ImGui::TextBuffer.new(\\2)")
  line = line.gsub(/\bchar (\w+)\[(\d+)\] = (".*")/, "char \\1 = ImGui::TextBuffer.new(\\3, \\2)")

  line = line.gsub(/\b(\w+)\b, IM_ARRAYSIZE\(\1\)/, "\\1")
  line = line.gsub(/, ImGuiDataType::\w+,/, ",")

  line = line.gsub(/(ImGui::MenuItem\([^,]+), NULL,/, %(\\1, "",))
  line = line.gsub(/, NULL, (ImGui\w*Flags::)/, ", flags: \\1")
  line = line.gsub(/\B(Mouse\w*\()0(,|\))/, "\\1:Left\\2")
  line = line.gsub(/\B(Mouse\w*\()1(,|\))/, "\\1:Right\\2")

  replaced_static = false
  line = line.gsub(/^static (\w+[^= ]*) (\w+)(\[.*?\]|\*|)( =(( .+);|$)|(\([^a-zA-Z].*\))?;$)/) do
    name = $2
    val = $6? || "#{$1}.new#{$7?}"
    if name.in?("begin", "end")
      name += "_"
    end
    static_names.add(name)
    replaced_static = true
    "static #{name} = #{val.strip}"
  end
  if !replaced_static
    static_names.each do |k|
      line = line.gsub(/(?<![."%])\b#{k}\b(?!:)/, "#{k}.val")
    end
  end

  line = line.gsub(/^(\w+[^= ]* )?(ImVec[24]) (\w+)\((.+)\);$/, "\\3 = \\2.new(\\4)")
  line = line.gsub(/^(?!static)(const )?(\w+[^= ]* )?(\w+)(\[\d*\]|\*)?? = (.+)$/, "\\3 = \\5")
  line = line.gsub(/^((static )?\w+) = \{(.*)\};?$/, "\\1 = [\\3]")

  line = line.gsub(/^(static )?([^()]+? )?(ImGui::)?(\w+)\((.*?)\) \{$/) do
    args = $5.presence.try &.split(", ").map do |a|
      arg, defa1, defa2 = a.partition(" = ")
      arg.split.last + defa1 + defa2
    end.join(", ")
    static_names.clear
    "def #{"self." if $1? || $3?}#{$4.underscore}(#{args})"
  end
  if line =~ /^static ?(.+? )?(ImGui::)?(\w+)\((.*?)\);$/
    next
  end

  line = line.gsub(/\bImColor\(/, "ImGui.color_convert_float4_to_u32(")

  line = line.gsub(/\b([A-Z][a-z]\w*)\(/) do
    "#{$1.underscore}("
  end
  line = line.gsub(/::([a-z])/, ".\\1")

  line = line.gsub(/^\b([\w.]+)(\+|-)\2;/, "\\1 \\2= 1")
  line = line.gsub(", ...", ", *args")

  line = line.gsub(/\((.+?) & ImGui\w*Flags::(\w+)\) == 0/, "!\\1.includes?(:\\2)")
  line = line.gsub(/ & ImGui\w*Flags::(\w+)\b/, ".includes?(:\\1)")
  line = line.gsub(/\b(\w+) & 1\b/, "\\1.odd?")

  line = line.gsub(/\bstrlen\((.+?)\)/, "\\1.size")
  line = line.gsub(/\b(ceil|floor)f?\((.+?)\)/, "(\\2).\\1")
  line = line.gsub(/\bfmodf?\((.+?), (.+?)\)/, "\\1 % \\2")
  line = line.gsub(/\bstrcmp\((.+?), (.+?)\)/, "\\1 <=> \\2")
  line = line.gsub(/\b(sin|cos|sqrt)f\(/, "Math.\\1(")
  line = line.gsub(/(\(ImVec4\))?ImColor::HSV\(/, "ImGui.hsv(")
  line = line.gsub(/IM_ARRAYSIZE\((.+?)\)/, "\\1.size")
  line = line.gsub(/IM_MIN\((.+?, .+?)\)/, "{\\1}.min")
  line = line.gsub(/IM_MAX\((.+?, .+?)\)/, "{\\1}.max")
  line = line.gsub(/IM_CLAMP\((.+?), (.+?, .+?)\)/, "\\1.clamp(\\2)")
  line = line.gsub(/IM_COL32\((.+?, .+?, .+?, .+?)\)/, "ImGui.col32(\\1)")
  line = line.gsub(/IM_COLOR\((.+?, .+?, .+?, .+?)\)/, "ImGui.col32(\\1)")
  line = line.gsub(/IM_ASSERT\((.+?)\)/, "assert(\\1)")
  line = line.gsub(/ *IM_FMTARGS\((.+?)\)/, "")
  line = line.gsub(/\bIM_UNICODE_CODEPOINT_MAX\b/, "Char.MAX_CODEPOINT")
  line = line.gsub(/\bNULL\b/, "nil")
  line = line.gsub(/\bFLT_MIN\b/, "Float32::MIN_POSITIVE")
  line = line.gsub(/\bFLT_MAX\b/, "Float32::MAX")
  line = line.gsub(/INT_(MIN|MAX)\b/, "Int32::\\1")
  line = line.gsub(/LLONG_(MIN|MAX)\b/, "Int64::\\1")
  line = line.gsub(/\bIMGUI_DEMO_MARKER\b/, "demo_marker")
  line = line.gsub(/\bIM_COL32_WHITE\b/, "ImGui.col32(255, 255, 255)")
  line = line.gsub(/\bIMGUI_(VERSION|PAYLOAD_TYPE)/, "ImGui::\\1")
  line = line.gsub(/" *IM_NEWLINE\b/, "\\n\"")
  line = line.gsub(/ *\bIM_PRI(d|u)64\b */, %(•"ll\\1"•))
  line = line.gsub(/"•"|•/, "")
  line = line.gsub(/^sn?printf\((\w+), (".+?"), (.+)\);$/, "\\1 = sprintf(\\2, \\3)")

  line = line.gsub(/(?<!:)\b[A-Z]{3,}_[A-Z_]+\b/) do
    $0.downcase
  end

  line = line.gsub(/\bconst /, "")
  line = line.gsub(/^\*(\w+) (\W?\W?=) (.+)/, "\\1.value \\2 \\3")

  line = line.gsub(/ImGui::(\w+)\(/) do
    "ImGui.#{$1.underscore}("
  end
  line = line.gsub(/\bImGui\.(show_about_window|show_demo_window|show_user_guide|show_style_editor)\b/, "\\1")

  line = line.gsub(/^continue;$/, "next")
  line = line.gsub(/;($| +#)/, "\\1")
  line = line.gsub(/\b\(\)/, "")

  guarded_strings.each_with_index do |s, i|
    line = line.sub(%(<STRING#{i + 1}>), s)
  end

  outp << "#{" " * indent unless line.empty?}#{line}"
end

outp << "end"

(outp.size - 1).downto(0) do |ai|
  a = outp[ai]
  ia = get_indent(a)
  if (a =~ /^ *(if )?(ImGui\.)((?:push|begin|tree)(?:_(?!pop\b)\w+)?)(\(.*\))?$/ ||
     a =~ /^ *(if )?()(push_style\w+)(\(.*\))?$/)
    with_if, with_imgui, def_name, args = $1?, $2, $3, $4?
    if def_name.starts_with?("tree_node")
      new_name = def_name
      pop_name = "tree_pop"
    elsif def_name == "tree_push"
      new_name = "with_tree"
      pop_name = "tree_pop"
    else
      push, sep, common = def_name.partition('_')
      new_name = ({"push" => "with", "begin" => ""}[push] + sep + common).lchop("_")
      pop_name = {"push" => "pop", "begin" => "end"}[push] + sep + common
    end
    if def_name == "begin"
      new_name = "window"
    elsif def_name.starts_with?("begin_popup")
      pop_name = "end_popup"
    end
    (ai + 1..outp.size).each do |bi|
      b = outp[bi]
      next if b.empty?
      ib = get_indent(b)
      if (ib == ia || with_if && ib == ia + 2) && b =~ /^ *#{with_imgui}#{pop_name}$/
        outp[ai] = " " * ia + "#{with_imgui}#{new_name}#{args} do"
        if with_if
          outp.delete_at(bi)
        else
          (ai + 1..bi - 1).each do |i|
            outp[i] = "#{"  " unless outp[i].empty?}#{outp[i]}"
          end
          outp[bi] = " " * ib + "end"
        end
        break
      end
      break if ib < ia || with_if && ib == ia
    end
  end
end

outp.each_with_index do |line, i|
  next if line.empty? && ((outp[i - 1] || "").strip.empty? || get_indent(outp.fetch(i - 1, "")) < get_indent(outp.fetch(i + 1, "")))
  puts line
end
