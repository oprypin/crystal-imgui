unless File.exists? "imgui_demo.cpp"
  `g++ -fpreprocessed -dD -E cimgui/imgui/imgui_demo.cpp > imgui_demo.cpp`  # Remove comments

  `clang-tidy imgui_demo.cpp -fix -fix-errors -checks="readability-braces-around-statements,readability-isolate-declaration" -- -Icimgui/imgui`

  `clang-format -i imgui_demo.cpp -style='{ColumnLimit: 0, PointerAlignment: Left, SpacesBeforeTrailingComments: 2, AlignTrailingComments: false, AllowShortFunctionsOnASingleLine: None}'`
end

static_names = {} of String => String?

outp = ["module ImGuiDemo"] of String


File.each_line("imgui_demo.cpp") do |fline|
  line = fline.lstrip
  indent = (fline.size - line.size)

  if line.starts_with?("#")
    next
  end
  if !line.empty?
    line = line.gsub(/( +|^)\/\/.*/, "")
    next if line.empty?
  end
  line = line.gsub(/\b(\d+)f\b/, "\\1f32")
  if line == "{"
    line = "begin"
  elsif line.in?("}", "};")
    line = "end"
  end
  line = line.gsub(/^for \(.+? (\w+) = (0); \1 < ([^& ]+); \1\+\+\) \{$/, "\\3.times do |\\1|")
  line = line.gsub(/^for \(.+? (\w+) = (0); \1 < ([^&]+); \1\+\+\) \{$/, "(\\3).times do |\\1|")
  line = line.gsub(/^for \(.+? (\w+) = (.+); \1 < ([^&]+); \1\+\+\) \{$/, "(\\2...\\3).each do |\\1|")
  line = line.gsub(/^for \(;;\) \{$/, "loop do")
  line = line.gsub(/^case (.+): \{$/, "when \\1 then begin")
  line = line.gsub(/^case (.+):$/, "when \\1")
  line = line.gsub(/^switch \((.+)\) \{$/, "case \\1")
  line = line.gsub(/^(if|while) \((.+)\) \{$/, "\\1 \\2")
  line = line.gsub(/^struct (.+) \{$/, "class \\1")
  line = line.gsub(/^\} else if \((.+)\) \{$/, "elsif \\1")
  line = line.gsub(/^\} else \{$/, "else")

  line = line.gsub(/\B\((unsigned int\*|float|intptr_t)\)/, "")
  line = line.gsub(/\b&|&\b/, "")
  line = line.gsub(/->/, ".")
  line = line.gsub(/\.(\w+)/) do
    ".#{$1.underscore}"
  end
  line = line.gsub(/(\w+)\.\b/) do
    "#{$1.underscore}."
  end

  line = line.gsub(/\b(ImGui\w+)_(\w+?)_?\b/, "ImGui::\\1::\\2")
  line = line.gsub(/\bImVec([24])\(/, "ImGui.vec\\1(")

  line = line.gsub(/^static \w+[^= ]* (\w+)(\[.*?\]|\*|)( =(( .+);|$)|;$)/) do
    name = $1
    val = $5?
    while static_names.has_key?(name)
      name += "_"
    end
    static_names[name] = nil
    static_names[$1] = name
    (outp.size - 1).downto(0) do |i|
      ind = (outp[i].size - outp[i].strip.size)
      if outp[i].strip.starts_with?("def ") && ind < indent
        outp.insert(i, " " * ind + "@@#{name} =#{val}")
        break
      end
    end
    next
  end
  static_names.each do |k, v|
    line = line.gsub(/(?<=[^."%])\b#{k}\b(?=.)/, "@@#{v}") if v
  end

  line = line.gsub(/^(\w+[^= ]* )?(ImVec[24]) (\w+)\((.+)\);$/, "\\3 = \\2.new(\\4)")
  line = line.gsub(/^(\w+[^= ]* )?(\w+)(\[\d*\]|\*)?? = (.+)$/, "\\2 = \\4")
  line = line.gsub(/(\(ImVec4\))?ImColor::HSV\(/, "ImGui::ImColor.hsv(")

  line = line.gsub(/^(static )?([^()]+? )?(ImGui::)?(\w+)\((.*?)\) \{$/) do
    args = $5.presence.try &.split(", ").map do |a|
      arg, defa1, defa2 = a.partition(" = ")
      arg.split.last + defa1 + defa2
    end.join(", ")
    static_names.transform_values! { nil }
    "def #{"self." if $1? || $3?}#{$4.underscore}(#{args})"
  end
  if line =~ /^static ?(.+? )?(ImGui::)?(\w+)\((.*?)\);$/
    next
  end

  line = line.gsub(/\b([A-Z][a-z]\w*)\(/) do
    "#{$1.underscore}("
  end
  line = line.gsub(/::([a-z])/, ".\\1")

  line = line.gsub(/^(\w+)(\+|-)\2;/, "\\1 \\2= 1")
  line = line.gsub(", ...", ", *args")

  line = line.gsub(/IM_ARRAYSIZE\((.+?)\)/, "\\1.size")
  line = line.gsub(/IM_MIN\((.+?, .+?)\)/, "{\\1}.min")
  line = line.gsub(/IM_MAX\((.+?, .+?)\)/, "{\\1}.max")
  line = line.gsub(/IM_CLAMP\((.+?), (.+?, .+?)\)/, "\\1.clamp(\\2)")
  line = line.gsub(/IM_COL32\((.+?, .+?, .+?, .+?)\)/, "ImGui.col32(\\1)")
  line = line.gsub(/IM_ASSERT\((.+?)\)/, "assert(\\1)")
  line = line.gsub(/ *IM_FMTARGS\((.+?)\)/, "")

  line = line.gsub(/\bIM_UNICODE_CODEPOINT_MAX\b/, "Char.MAX_CODEPOINT")
  line = line.gsub(/\bNULL\b/, "nil")
  line = line.gsub(/" *IM_NEWLINE\b/, "\\n\"")

  line = line.gsub(/"$/, "\" +")
  line = line.gsub(/\bconst /, "")

  line = line.gsub(/ImGui::(\w+)\(/) do
    "ImGui.#{$1.underscore}("
  end
  line = line.gsub(/;($| +#)/, "\\1")

  next if line.empty? && outp.last.strip.empty?
  outp << " " * indent + line
end

outp << "end"

outp.each do |line|
  puts line
end
