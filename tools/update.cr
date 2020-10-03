# Update generated sources according to upstream.

# 1. Check out the desired version under cimgui/imgui
# 2. Run `crystal tools/update.cr`
# 3. Resolve merge conflicts

require "./diff_util"

merge_upstream("cimgui/imgui", "src/demo.cr") do
  `crystal generate_demo.cr`
end
