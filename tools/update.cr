# Update generated sources according to upstream.

# 1. Check out the desired version under cimgui/imgui
# 2. Run `crystal tools/update.cr`
# 3. Resolve merge conflicts

require "./diff_util"

DEMO = "src/demo.cr"

merger = UpstreamMerger(String).new("cimgui/imgui", File.open(DEMO, &.read_line))
merger.set_modified DEMO, content: File.read(DEMO)

merger.checkout_old
merger.set_old DEMO, content: `git show HEAD:generate_demo.cr | crystal eval`

merger.checkout_new
merger.set_new DEMO, content: `crystal generate_demo.cr`

merger.merge do |file, content|
  File.write(file, content)
end
