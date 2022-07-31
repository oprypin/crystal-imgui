# Font API (ImFontConfig, ImFontGlyph, ImFontAtlasFlags, ImFontAtlas, ImFontGlyphRangesBuilder, ImFont)  

### ::: ImGui::ImFontConfig

##### ::: ImGui::ImFontConfig.font_data

          // TTF/OTF data

##### ::: ImGui::ImFontConfig.font_data_size

          // TTF/OTF data size

##### ::: ImGui::ImFontConfig.font_data_owned_by_atlas

 true     // TTF/OTF data ownership taken by the container [`ImGui::ImFontAtlas`][] (will delete memory itself).  

##### ::: ImGui::ImFontConfig.font_no

 0        // Index of font within TTF/OTF file  

##### ::: ImGui::ImFontConfig.size_pixels

          // Size in pixels for rasterizer (more or less maps to the resulting font height).

##### ::: ImGui::ImFontConfig.oversample_h

 3        // Rasterize at higher quality for sub-pixel positioning. Note the difference between 2 and 3 is minimal so you can reduce this to 2 to save memory. Read https://github.com/nothings/stb/blob/master/tests/oversample/README.md for details.  

##### ::: ImGui::ImFontConfig.oversample_v

 1        // Rasterize at higher quality for sub-pixel positioning. This is not really useful as we don't use sub-pixel positions on the Y axis.  

##### ::: ImGui::ImFontConfig.pixel_snap_h

 false    // Align every glyph to pixel boundary. Useful e.g. if you are merging a non-pixel aligned font with the default font. If enabled, you can set OversampleH/V to 1.  

##### ::: ImGui::ImFontConfig.glyph_extra_spacing

 0, 0     // Extra spacing (in pixels) between glyphs. Only X axis is supported for now.  

##### ::: ImGui::ImFontConfig.glyph_offset

 0, 0     // Offset all glyphs from this font input.  

##### ::: ImGui::ImFontConfig.glyph_ranges

 NULL     // Pointer to a user-provided list of Unicode range (2 value per range, values are inclusive, zero-terminated list). THE ARRAY DATA NEEDS TO PERSIST AS LONG AS THE FONT IS ALIVE.  

##### ::: ImGui::ImFontConfig.glyph_min_advance_x

 0        // Minimum AdvanceX for glyphs, set Min to align font icons, set both Min/Max to enforce mono-space font  

##### ::: ImGui::ImFontConfig.glyph_max_advance_x

 FLT_MAX  // Maximum AdvanceX for glyphs  

##### ::: ImGui::ImFontConfig.merge_mode

 false    // Merge into previous [`ImGui::ImFont`][], so you can combine multiple inputs font into one [`ImGui::ImFont`][] (e.g. ASCII font + icons + Japanese glyphs). You may want to use GlyphOffset.y when merge font of different heights.  

##### ::: ImGui::ImFontConfig.font_builder_flags

 0        // Settings for custom font builder. THIS IS BUILDER IMPLEMENTATION DEPENDENT. Leave as zero if unsure.  

##### ::: ImGui::ImFontConfig.rasterizer_multiply

 1.0f     // Brighten (>1.0f) or darken (<1.0f) font output. Brightening small fonts may be a good workaround to make them more readable.  

##### ::: ImGui::ImFontConfig.ellipsis_char

 -1       // Explicitly specify unicode codepoint of ellipsis character. When fonts are being merged first specified ellipsis will be used.

#### [Internal]  

##### ::: ImGui::ImFontConfig.name

 Name (strictly to ease debugging)  

##### ::: ImGui::ImFontConfig.dst_font

Hold rendering data for one glyph.  
(Note: some language parsers may fail to convert the 31+1 bitfield members, in this case maybe drop store a single u32 or we can rework this)  

### ::: ImGui::ImFontGlyph

##### ::: ImGui::ImFontGlyph.colored

 Flag to indicate glyph is colored and should generally ignore tinting (make it usable with no shift on little-endian as this is used in loops)  

##### ::: ImGui::ImFontGlyph.visible

 Flag to indicate glyph has no visible pixels (e.g. space). Allow early out when rendering.  

##### ::: ImGui::ImFontGlyph.codepoint

 0x0000..0x10FFFF  

##### ::: ImGui::ImFontGlyph.advance_x

 Distance to next character (= data from font + [`ImGui::ImFontConfig`][]::GlyphExtraSpacing.x baked in)  

##### ::: ImGui::ImFontGlyph.x0

##### ::: ImGui::ImFontGlyph.y0

##### ::: ImGui::ImFontGlyph.x1

##### ::: ImGui::ImFontGlyph.y1

 Glyph corners  

##### ::: ImGui::ImFontGlyph.u0

##### ::: ImGui::ImFontGlyph.v0

##### ::: ImGui::ImFontGlyph.u1

##### ::: ImGui::ImFontGlyph.v1

 Texture coordinates  

Helper to build glyph ranges from text/string data. Feed your application strings/characters to it then call BuildRanges().  
This is essentially a tightly packed of vector of 64k booleans = 8KB storage.  

### ::: ImGui::ImFontGlyphRangesBuilder

##### ::: ImGui::ImFontGlyphRangesBuilder.used_chars

 Store 1-bit per Unicode code point (0=unused, 1=used)  

 Get bit n in the array  
 Set bit n in the array  
 Add character  
 Add string (each character of the UTF-8 string are added)  
 Add ranges, e.g. builder.AddRanges([`ImGui::ImFontAtlas`][]::GetGlyphRangesDefault()) to force add all of ASCII/Latin+Ext  
 Output new ranges  

See [`ImGui::ImFontAtlas`][]::AddCustomRectXXX functions.  

### ::: ImGui::ImFontAtlasCustomRect

##### ::: ImGui::ImFontAtlasCustomRect.width

##### ::: ImGui::ImFontAtlasCustomRect.height

 Input    // Desired rectangle dimension  

##### ::: ImGui::ImFontAtlasCustomRect.x

##### ::: ImGui::ImFontAtlasCustomRect.y

 Output   // Packed position in Atlas  

##### ::: ImGui::ImFontAtlasCustomRect.glyph_id

 Input    // For custom font glyphs only (ID < 0x110000)  

##### ::: ImGui::ImFontAtlasCustomRect.glyph_advance_x

 Input    // For custom font glyphs only: glyph xadvance  

##### ::: ImGui::ImFontAtlasCustomRect.glyph_offset

 Input    // For custom font glyphs only: glyph display offset  

##### ::: ImGui::ImFontAtlasCustomRect.font

 Input    // For custom font glyphs only: target font  

## Flags for [`ImGui::ImFontAtlas`][] build  

### ::: ImGui::ImFontAtlasFlags

- `None`  

- `NoPowerOfTwoHeight`  
 Don't round the height to next power of two  

- `NoMouseCursors`  
 Don't build software mouse cursors into the atlas (save a little texture memory)  

- `NoBakedLines`  
 Don't build thick line textures into the atlas (save a little texture memory, allow support for point/nearest filtering). The AntiAliasedLinesUseTex features uses them, otherwise they will be rendered using polygons (more expensive for CPU/GPU).  

Load and rasterize multiple TTF/OTF fonts into a same texture. The font atlas will build a single texture holding:  

  - One or more fonts.
  - Custom graphics data needed to render the shapes needed by Dear ImGui.
  - Mouse cursor shapes for software cursor rendering (unless setting 'Flags |= ImFontAtlasFlags_NoMouseCursors' in the font atlas).

It is the user-code responsibility to setup/build the atlas, then upload the pixel data into a texture accessible by your graphics api.  

  - Optionally, call any of the AddFont*** functions. If you don't call any, the default font embedded in the code will be loaded for you.
  - Call GetTexDataAsAlpha8() or GetTexDataAsRGBA32() to build and retrieve pixels data.
  - Upload the pixels data into a texture within your graphics system (see imgui_impl_xxxx.cpp examples)
  - Call SetTexID(my_tex_id); and pass the pointer/identifier to your texture in a format natural to your graphics API.
   This value will be passed back to you during rendering to identify the texture. Read FAQ entry about ImTextureID for more details.

Common pitfalls:  

- If you pass a 'glyph_ranges' array to AddFont*** functions, you need to make sure that your array persist up until the
  atlas is build (when calling GetTexData*** or Build()). We only copy the pointer, not the data.
- Important: By default, AddFontFromMemoryTTF() takes ownership of the data. Even though we are not writing to it, we will free the pointer on destruction.
  You can set font_cfg->FontDataOwnedByAtlas=false to keep ownership of your data and it won't be freed,
- Even though many functions are suffixed with "TTF", OTF data is supported just as well.
- This is an old API and it is currently awkward for those and and various other reasons! We will address them in the future!

### ::: ImGui::ImFontAtlas

 Note: Transfer ownership of 'ttf_data' to [`ImGui::ImFontAtlas`][]! Will be deleted after destruction of the atlas. Set font_cfg->FontDataOwnedByAtlas=false to keep ownership of your data and it won't be freed.  
 'compressed_font_data' still owned by caller. Compress with binary_to_compressed_c.cpp.  
 'compressed_font_data_base85' still owned by caller. Compress with binary_to_compressed_c.cpp with -base85 parameter.  
 Clear input data (all [`ImGui::ImFontConfig`][] structures including sizes, TTF data, glyph ranges, etc.) = all the data used to build the texture and fonts.  
 Clear output texture data (CPU side). Saves RAM once the texture has been copied to graphics memory.  
 Clear output font data (glyphs storage, UV coordinates).  
 Clear all input and output.  

Build atlas, retrieve pixel data.  
User is in charge of copying the pixels into graphics memory (e.g. create a texture with your engine). Then store your texture handle with SetTexID().  
The pitch is always = Width * BytesPerPixels (1 or 4)  
Building in RGBA32 format is provided for convenience and compatibility, but note that unless you manually manipulate or copy color data into  
the texture (e.g. when using the AddCustomRect*** api), then the RGB pixels emitted will always be white (~75% of memory/bandwidth waste.  
 Build pixels data. This is called automatically for you by the GetTexData*** functions.  
 1 byte per-pixel  
 4 bytes-per-pixel  
 Bit ambiguous: used to detect when user didn't built texture but effectively we should check TexID != 0 except that would be backend dependent...  

#### Glyph Ranges  

#### Helpers to retrieve list of common Unicode ranges (2 value per range, values are inclusive, zero-terminated list)  
NB: Make sure that your string are UTF-8 and NOT in your local code page. In C++11, you can create UTF-8 string literal using the u8"Hello world" syntax. See FAQ for details.  
NB: Consider using [`ImGui::ImFontGlyphRangesBuilder`][] to build glyph ranges from textual data.  
 Basic Latin, Extended Latin  
 Default + Korean characters  
 Default + Hiragana, Katakana, Half-Width, Selection of 2999 Ideographs  
 Default + Half-Width + Japanese Hiragana/Katakana + full set of about 21000 CJK Unified Ideographs  

 Default + about 400 Cyrillic characters  
 Default + Thai characters  
 Default + Vietnamese characters  

#### [BETA] Custom Rectangles/Glyphs API  

You can request arbitrary rectangles to be packed into the atlas, for your own purposes.  

- After calling Build(), you can query the rectangle position and render your pixels.
- If you render colored output, set 'atlas->TexPixelsUseColors = true' as this may help some backends decide of prefered texture format.
- You can also request your rectangles to be mapped as font glyph (given a font + Unicode point),
  so you can render e.g. custom colorful icons and use them as regular glyphs.
- Read docs/FONTS.md for more details about using colorful icons.
- Note: this API may be redesigned later in order to support multi-monitor varying DPI settings.

#### [Internal]  

#### Members  

##### ::: ImGui::ImFontAtlas.flags

 Build flags (see [`ImGui::ImFontAtlasFlags`][])  

##### ::: ImGui::ImFontAtlas.tex_id

 User data to refer to the texture once it has been uploaded to user's graphic systems. It is passed back to you during rendering via the [`ImGui::ImDrawCmd`][] structure.  

##### ::: ImGui::ImFontAtlas.tex_desired_width

 Texture width desired by user before Build(). Must be a power-of-two. If have many glyphs your graphics API have texture size restrictions you may want to increase texture width to decrease height.  

##### ::: ImGui::ImFontAtlas.tex_glyph_padding

 Padding between glyphs within texture in pixels. Defaults to 1. If your rendering method doesn't rely on bilinear filtering you may set this to 0 (will also need to set AntiAliasedLinesUseTex = false).  

##### ::: ImGui::ImFontAtlas.locked

 Marked as Locked by [`ImGui.new_frame`][] so attempt to modify the atlas will assert.  

#### [Internal]  
NB: Access texture data via GetTexData*() calls! Which will setup a default font for you.  

##### ::: ImGui::ImFontAtlas.tex_ready

 Set when texture was built matching current font input  

##### ::: ImGui::ImFontAtlas.tex_pixels_use_colors

 Tell whether our texture data is known to use colors (rather than just alpha channel), in order to help backend select a format.  

##### ::: ImGui::ImFontAtlas.tex_pixels_alpha8

 1 component per pixel, each component is unsigned 8-bit. Total size = TexWidth * TexHeight  

##### ::: ImGui::ImFontAtlas.tex_pixels_rgba32

 4 component per pixel, each component is unsigned 8-bit. Total size = TexWidth * TexHeight * 4  

##### ::: ImGui::ImFontAtlas.tex_width

 Texture width calculated during Build().  

##### ::: ImGui::ImFontAtlas.tex_height

 Texture height calculated during Build().  

##### ::: ImGui::ImFontAtlas.tex_uv_scale

 = (1.0f/TexWidth, 1.0f/TexHeight)  

##### ::: ImGui::ImFontAtlas.tex_uv_white_pixel

 Texture coordinates to a white pixel  

##### ::: ImGui::ImFontAtlas.fonts

 Hold all the fonts returned by AddFont*. Fonts[0] is the default font upon calling [`ImGui.new_frame`][], use [`ImGui.push_font`][]/[`ImGui.pop_font`][] to change the current font.  

##### ::: ImGui::ImFontAtlas.custom_rects

 Rectangles for packing custom texture data into the atlas.  

##### ::: ImGui::ImFontAtlas.config_data

 Configuration data  

##### ::: ImGui::ImFontAtlas.tex_uv_lines

 UVs for baked anti-aliased lines  

#### [Internal] Font builder  

##### ::: ImGui::ImFontAtlas.font_builder_io

 Opaque interface to a font builder (default to stb_truetype, can be changed to use FreeType by defining IMGUI_ENABLE_FREETYPE).  

##### ::: ImGui::ImFontAtlas.font_builder_flags

 Shared flags (for all fonts) for custom font builder. THIS IS BUILD IMPLEMENTATION DEPENDENT. Per-font override is also available in [`ImGui::ImFontConfig`][].  

#### [Internal] Packing data  

##### ::: ImGui::ImFontAtlas.pack_id_mouse_cursors

 Custom texture rectangle ID for white pixel and mouse cursors  

##### ::: ImGui::ImFontAtlas.pack_id_lines

 Custom texture rectangle ID for baked anti-aliased lines  

#### [Obsolete]  
 OBSOLETED in 1.72+  
 OBSOLETED in 1.67+  

## Font runtime data and rendering  
[`ImGui::ImFontAtlas`][] automatically loads a default embedded font for you when you call GetTexDataAsAlpha8() or GetTexDataAsRGBA32().  

### ::: ImGui::ImFont

#### Members: Hot ~20/24 bytes (for [`ImGui.calc_text_size`][])  

##### ::: ImGui::ImFont.index_advance_x

 12-16 // out //            // Sparse. Glyphs->AdvanceX in a directly indexable way (cache-friendly for [`ImGui.calc_text_size`][] functions which only this this info, and are often bottleneck in large UI).  

##### ::: ImGui::ImFont.fallback_advance_x

 4     // out // = FallbackGlyph->AdvanceX  

##### ::: ImGui::ImFont.font_size

 4     // in  //            // Height of characters/line, set during loading (don't change after loading)  

#### Members: Hot ~28/40 bytes (for [`ImGui.calc_text_size`][] + render loop)  

##### ::: ImGui::ImFont.index_lookup

 12-16 // out //            // Sparse. Index glyphs by Unicode code-point.  

##### ::: ImGui::ImFont.glyphs

 12-16 // out //            // All glyphs.  

##### ::: ImGui::ImFont.fallback_glyph

 4-8   // out // = FindGlyph(FontFallbackChar)  

#### Members: Cold ~32/40 bytes  

##### ::: ImGui::ImFont.container_atlas

 4-8   // out //            // What we has been loaded into  

##### ::: ImGui::ImFont.config_data

 4-8   // in  //            // Pointer within ContainerAtlas->ConfigData  

##### ::: ImGui::ImFont.config_data_count

 2     // in  // ~ 1        // Number of [`ImGui::ImFontConfig`][] involved in creating this font. Bigger than 1 when merging multiple font sources into one [`ImGui::ImFont`][].  

##### ::: ImGui::ImFont.fallback_char

 2     // out // = FFFD/'?' // Character used if a glyph isn't found.  

##### ::: ImGui::ImFont.ellipsis_char

 2     // out // = '...'    // Character used for ellipsis rendering.  

##### ::: ImGui::ImFont.dot_char

 2     // out // = '.'      // Character used for ellipsis rendering (if a single '...' character isn't found)  

##### ::: ImGui::ImFont.dirty_lookup_tables

 1     // out //  

##### ::: ImGui::ImFont.scale

 4     // in  // = 1.f      // Base font scale, multiplied by the per-window font scale which you can adjust with [`ImGui.set_window_font_scale`][]  

##### ::: ImGui::ImFont.ascent

##### ::: ImGui::ImFont.descent

 4+4   // out //            // Ascent: distance from top to bottom of e.g. 'A' [0..FontSize]  

##### ::: ImGui::ImFont.metrics_total_surface

 out //            // Total surface in pixels to get an idea of the font rasterization/texture cost (not exact, we approximate the cost of padding between glyphs)  

##### ::: ImGui::ImFont.used4k_pages_map

 2 bytes if ImWchar=ImWchar16, 34 bytes if ImWchar==ImWchar32. Store 1-bit for each block of 4K codepoints that has one active glyph. This is mainly used to facilitate iterations across all used codepoints.  

#### Methods  

'max_width' stops rendering after a certain width (could be turned into a 2d size). FLT_MAX to disable.  
'wrap_width' enable automatic word-wrapping across multiple lines to fit into given width. 0.0f to disable.  
 utf8  

#### [Internal] Don't use!  

 Makes 'dst' character/glyph points to 'src' character/glyph. Currently needs to be called AFTER fonts have been built.  

