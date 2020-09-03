# crystal-imgui

#### [Crystal][] bindings to [Dear ImGui][imgui], through [cimgui][]

Introduction
------------

This library lets you use [Dear ImGui][imgui] with the [Crystal][] programming language.

[Dear ImGui] is an immediate-mode library for programming and rendering graphical user interfaces. But note that just by itself it won't immediately let you do those things, it needs to be wired up to code that actually handles rendering and input. You can write these yourself or use a library:

* [crystal-imgui-sfml][] - backend using [SFML][] (assumed through [CrSFML][]).  
  Please refer to its instructions primarily, as it takes over large parts of the installation.

Installation
------------

Following the installation process of [crystal-imgui-sfml][] is recommended (it even provides *libcimgui.so* automatically), but continue here if you want an alternate route.

*crystal-imgui* actually binds to the [cimgui][] library. The supported version is bundled as a submodule (for other versions you can try your luck by pointing _generate.cr_ at it instead). This repository needs to have been cloned with submodules:

```bash
git clone --recursive https://github.com/oprypin/crystal-imgui
```

Then you can build [cimgui][]:

```bash
cd cimgui
cmake . -DCMAKE_CXX_FLAGS=""
cmake --build .
ln -s cimgui.so libcimgui.so  # or .dylib on macOS
```

Yes, the flag is required (just makes the library play much nicely with Unicode *and* Crystal), and the symlink is also required, because the library ends up as _cimgui.so_ but somehow is referred by both that name and _libcimgui.so_

### Building a project

Try the example from inside the folder of *imgui*:

```bash
crystal build examples/test.cr
```

Prior `libcimgui.so` library (bundled with the project) to the search path, running it will require that addition to be done manually:

```bash
export LD_LIBRARY_PATH="$(pwd)"
./example
```

For your own project, *imgui-sfml* will be in a subdirectory, so adjust this accordingly:

```bash
export LD_LIBRARY_PATH="$(pwd)/lib/imgui-sfml"
printf 'require "crsfml"\nrequire "imgui"\nrequire "imgui-sfml"\n' >> my_project.cr
crystal run my_project.cr
```


Credits
-------

*crystal-imgui* was made by [Oleh Prypin][oprypin]. It uses and is based on [Dear ImGui][imgui].

*crystal-imgui* is [licensed](LICENSE.md) under the terms and conditions of the *MIT* license.


[imgui-sfml]: https://github.com/eliasdaler/imgui-sfml
[imgui]: https://github.com/ocornut/imgui
[sfml]: https://www.sfml-dev.org/ "Simple and Fast Multimedia Library"
[crystal-imgui-sfml]: https://github.com/oprypin/crystal-imgui-sfml
[crsfml]: https://github.com/oprypin/crsfml

[crystal]: https://crystal-lang.org/
[shards]: https://github.com/crystal-lang/shards

[oprypin]: https://github.com/oprypin
