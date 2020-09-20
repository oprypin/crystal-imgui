#!/bin/sh

set -ex

cd "$(dirname "$0")/.."

rm -rf docs

crystal doc --project-name=crystal-imgui --project-version='' --source-refname=master

cd docs

find . -type f -exec sed -i -r -e 's,<a href=".*index.html">,<a href="https://github.com/oprypin/crystal-imgui#readme">,' {} \;

cat << EOF > index.html
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="refresh" content="1;url=ImGui.html"/>
    <title>Redirecting...</title>
    <script type="text/javascript">
        window.location.href = "ImGui.html";
    </script>
</head>
<body>
    <a href="ImGui.html">Redirecting...</a>
</body>
</html>
EOF
