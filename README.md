# crystal-imgui

#### [Crystal][] bindings to [Dear ImGui][imgui], through [cimgui][]

Introduction
------------

This library lets you use [Dear ImGui][imgui] with the [Crystal][] programming language.

[Dear ImGui][imgui] is an immediate-mode library for programming and rendering graphical user interfaces. But note that just by itself it won't directly let you do those things, it needs to be wired up to code that actually handles rendering and input. You can write these yourself or use a library ("backend"):

* [crystal-imgui-sfml][] - backend using [SFML][] (assumed through [CrSFML][]).  
  Please refer to its instructions primarily, as it takes over large parts of the installation.

Documentation
-------------

**[API documentation](https://oprypin.github.io/crystal-imgui/)** is currently missing any actual descriptions, but it cross-links to the well-commented [imgui.h](https://github.com/ocornut/imgui/blob/master/imgui.h) header file.

For guidance specific to Crystal and *crystal-imgui*, see [Usage](#usage).

**Examples** of most possible usages of the library are covered in the extensive [src/demo.cr](src/demo.cr) (entry point [examples/demo_sfml.cr](examples/demo_sfml.cr); note that it requires [crystal-imgui-sfml][]).

There's also [a small self-contained example](https://github.com/oprypin/crystal-imgui-sfml/blob/master/examples/simple.cr) from [crystal-imgui-sfml][].

Installation
------------

Following the installation process of [crystal-imgui-sfml][] is recommended instead (it even provides *libcimgui.so* automatically), but continue here if you want an alternate route.

Repeat: **do not** follow these instructions if you're using [crystal-imgui-sfml][] (which in the current state of things you probably are).

*crystal-imgui* actually binds to the [cimgui][] library. The supported version is bundled as a submodule (for other versions you can try your luck by [re-generating sources](#contributing)). This repository needs to have been cloned with submodules:

```bash
git clone --recursive https://github.com/oprypin/crystal-imgui
```

Then you can build [cimgui][]:

```bash
cd cimgui
cmake -DCMAKE_CXX_FLAGS='-DIMGUI_USE_WCHAR32' .
cmake --build .
ln -s cimgui.so libcimgui.so  # or .dylib on macOS
```

Yes, the flag is required (just makes the library play much nicely with Unicode *and* Crystal), and the symlink is also required, because the library ends up as _cimgui.so_ but somehow is referred by both that name and _libcimgui.so_.

### Building a project

Try the example from inside the folder of *crystal-imgui*:

```bash
crystal run examples/test.cr
```

Prior to that you'll need to add *cimgui* to the library search path:

```bash
export LD_LIBRARY_PATH="$(pwd)/cimgui"
export LIBRARY_PATH="$(pwd)/cimgui"
```

For your own project, *crystal-imgui* will be in a subdirectory, so adjust this accordingly.

Usage
-----

Using *crystal-imgui* is agnostic of the [backend](#introduction) for the most part, you invoke those just at the beginning of a frame, to process inputs, and at the end, to do the actual rendering (generally [imgui][] just builds up the things to be drawn until the end).

The API surface follows [Dear ImGui][imgui] itself very closely. Main differences are:

* Functions are lowercased: `ImGui::InputFloat3()` becomes `ImGui.input_float3`.
* Types are all in the module as well: `ImGuiIO` becomes `ImGui::ImGuiIO`.
    * *But* you're welcome to "unpack" those as an opt-in, by running `include ImGui::TopLevel`.
* Enums are namespaced.
* **Important**: To faithfully preserve the APIs of ImGui where its functions accept pointers that are used both for input and output (and for lack of an obvious alternative), *crystal-imgui* also requires pointers to be passed to it in the same way.
    * **However**, since Crystal requires very prohibitive circumstances to be able to take an actual pointer, *crystal-imgui* actually wraps these functions into macros, for which `pointerof(foo.bar)` is just a fake syntax that will be transformed into a call to `foo.bar` for reading and a call to `foo.bar=(value)` for writing. As another example, `pointerof(arr[0])` also works - rewritten as `arr[0] = value`.
    * If the input kind expects N values, then a `Slice` of N values should be passed directly instead.
    * For editable strings, one should pass an `ImGui::TextBuffer` instead.
* String buffers (particularly begin+end pairs) are abstracted as `Slice` or `ImGui::TextBuffer`.
    * For the latter, *crystal-imgui* even takes the liberty to implement the buffer resize callback for unbounded text inputs.
* `ImVector` is discouraged. Usually you can just work with `Array` or `Slice`.
* `ImColor` is even more discouraged, in favor of `ImVec4`. See some color helper functions in _src/imgui.cr_.

Contributing
------------

Note that most source files of *crystal-imgui* are auto-generated from outputs of [cimgui][].

If you're editing files, make sure they wouldn't be overwritten by `generate.cr` - in that case that is the file that you should be editing instead. In general, to generate the source code, run this:

```bash
crystal generate.cr  # assumes cimgui/ is populated, writes to src/
crystal tool format src
```

The process to update the ImGui demo is fairly manual. First, run the update tool:

```bash
crystal tools/update.cr
```

The update tool does two things:
- Uses `generate_demo.cr` to perform the initial translation from the ImGui demo to Crystal code
- Merges changes into `src/demo.cr` so that existing work is not lost

Beyond this point, the additional translation must be done manually. As always, please ensure to use the Crystal format tool to format the demo code, otherwise it will fail the build.

Credits
-------

*crystal-imgui* was made by [Oleh Prypin][oprypin]. It uses and is based on [Dear ImGui][imgui] and [cimgui][].

*crystal-imgui* is [licensed](LICENSE.md) under the terms and conditions of the *MIT* license.


[imgui]: https://github.com/ocornut/imgui
[cimgui]: https://github.com/cimgui/cimgui
[sfml]: https://www.sfml-dev.org/ "Simple and Fast Multimedia Library"
[crystal-imgui-sfml]: https://github.com/oprypin/crystal-imgui-sfml
[crsfml]: https://github.com/oprypin/crsfml

[crystal]: https://crystal-lang.org/

[oprypin]: https://github.com/oprypin
