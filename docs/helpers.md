# Helpers (ImGuiOnceUponAFrame, ImGuiTextFilter, ImGuiTextBuffer, ImGuiStorage, ImGuiListClipper, ImColor)  

## Helper: Unicode defines  
 Invalid Unicode code point (standard value).  

 Maximum Unicode code point supported by this build.  

 Maximum Unicode code point supported by this build.  

Helper: Execute a block of code at maximum once a frame. Convenient if you want to quickly create an UI within deep-nested code that runs multiple times every frame.  
Usage: static [`ImGui::ImGuiOnceUponAFrame`][] oaf; if (oaf) [`ImGui.text`][]("This will be called only once per frame");  

### ::: ImGui::ImGuiOnceUponAFrame

##### ::: ImGui::ImGuiOnceUponAFrame.ref_frame

Helper: Parse and apply text filters. In format "aaaaa[,bbbb][,ccccc]"  

### ::: ImGui::ImGuiTextFilter

 Helper calling [`ImGui.input_text`][]+Build  

#### [Internal]  

##### ::: ImGui::ImGuiTextFilter.input_buf

##### ::: ImGui::ImGuiTextFilter.filters

##### ::: ImGui::ImGuiTextFilter.count_grep

## Helper: Growable text buffer for logging/accumulating text  
(this could be called 'ImGuiTextBuilder' / 'ImGuiStringBuilder')  

 Buf is zero-terminated, so end() will point on the zero-terminator  

## Helper: Key->Value storage  
Typically you don't have to worry about this since a storage is held within each Window.  
We use it to e.g. store collapse state for a tree (Int 0/1)  
This is optimized for efficient lookup (dichotomy into a contiguous buffer) and rare insertion (typically tied to user interactions aka max once a frame)  
You can use it as custom user storage for temporary values. Declare your own storage if, for example:  

- You want to manipulate the open/close state of a particular sub-tree in your interface (tree node uses Int 0/1 to store their state).
- You want to store custom debug data easily without adding or editing structures in your code (probably not efficient, but convenient)

Types are NOT stored, so it is up to you to make sure your Key don't collide with different types.  

### ::: ImGui::ImGuiStorage

#### [Internal]  

##### ::: ImGui::ImGuiStorage.data

- Get***() functions find pair, never add/allocate. Pairs are sorted so a query is O(log N)
- Set***() functions find pair, insertion on demand if missing.
- Sorted insertion is costly, paid once. A typical frame shouldn't need to insert any new pair.

 default_val is NULL  

- Get***Ref() functions finds pair, insert on demand if missing, return pointer. Useful if you intend to do Get+Set.
- References are only valid until a new value is added to the storage. Calling a Set***() function or a Get***Ref() function invalidates the pointer.
- A typical use case where this is convenient for quick hacking (e.g. add storage during a live Edit&Continue session if you can't modify existing struct)
     float* pvar = ImGui::GetFloatRef(key); [`ImGui.slider_float`][]("var", pvar, 0, 100.0f); some_var += *pvar;

#### Use on your own storage if you know only integer are being stored (open/close all tree nodes)  

For quicker full rebuild of a storage (instead of an incremental one), you may add all your contents and then sort once.  

Helper: Manually clip large list of items.  
If you have lots evenly spaced items and you have a random access to the list, you can perform coarse  
clipping based on visibility to only submit items that are in view.  
The clipper calculates the range of visible items and advance the cursor to compensate for the non-visible items we have skipped.  
(Dear ImGui already clip items based on their bounds but: it needs to first layout the item to do so, and generally  
 fetching/submitting your own data incurs additional cost. Coarse clipping using [`ImGui::ImGuiListClipper`][] allows you to easily
 scale using lists with tens of thousands of items without a problem)

Usage:  
  [`ImGui::ImGuiListClipper`][] clipper;
  clipper.Begin(1000);         // We have 1000 elements, evenly spaced.
  while (clipper.Step())
      for (int i = clipper.DisplayStart; i < clipper.DisplayEnd; i++)
          [`ImGui.text`][]("line number %d", i);

Generally what happens is:  

- Clipper lets you process the first element (DisplayStart = 0, DisplayEnd = 1) regardless of it being visible or not.
- User code submit that one element.
- Clipper can measure the height of the first element
- Clipper calculate the actual range of elements to display based on the current clipping rectangle, position the cursor before the first visible element.
- User code submit visible elements.
- The clipper also handles various subtleties related to keyboard/gamepad navigation, wrapping etc.

### ::: ImGui::ImGuiListClipper

##### ::: ImGui::ImGuiListClipper.display_start

 First item to display, updated by each call to Step()  

##### ::: ImGui::ImGuiListClipper.display_end

 End of items to display (exclusive)  

##### ::: ImGui::ImGuiListClipper.items_count

 [Internal] Number of items  

##### ::: ImGui::ImGuiListClipper.items_height

 [Internal] Height of item after a first step and item submission can calculate it  

##### ::: ImGui::ImGuiListClipper.start_pos_y

 [Internal] Cursor position at the time of Begin() or after table frozen rows are all processed  

##### ::: ImGui::ImGuiListClipper.temp_data

 [Internal] Internal data  

items_count: Use INT_MAX if you don't know how many items you have (in which case the cursor won't be advanced in the final step)  
items_height: Use -1.0f to be calculated automatically on first step. Otherwise pass in the distance between your items, typically [`ImGui.get_text_line_height_with_spacing`][] or [`ImGui.get_frame_height_with_spacing`][].  

 Automatically called on the last call of Step() that returns false.  
 Call until it returns false. The DisplayStart/DisplayEnd fields will be set and you can process/draw those items.  

Call ForceDisplayRangeByIndices() before first call to Step() if you need a range of items to be displayed regardless of visibility.  
 item_max is exclusive e.g. use (42, 42+1) to make item 42 always visible BUT due to alignment/padding of certain items it is likely that an extra item may be included on either end of the display range.  

 [removed in 1.79]  

## Helpers macros to generate 32-bit encoded colors  
User can declare their own format by #defining the 5 _SHIFT/_MASK macros in their imconfig file.  

 Opaque white = 0xFFFFFFFF  

 Opaque black  

 Transparent black = 0x00000000  

## Helper: [`ImGui::ImColor`][] implicitly converts colors to either ImU32 (packed 4x1 byte) or [`ImGui::ImVec4`][] (4x1 float)  
Prefer using IM_COL32() macros if you want a guaranteed compile-time ImU32 for usage with [`ImGui::ImDrawList`][] API.  
**Avoid storing [`ImGui::ImColor`][]! Store either u32 of [`ImGui::ImVec4`][]. This is not a full-featured color class. MAY OBSOLETE.  
**None of the ImGui API are using [`ImGui::ImColor`][] directly but you can use it as a convenience to pass colors in either ImU32 or [`ImGui::ImVec4`][] formats. Explicitly cast to ImU32 or [`ImGui::ImVec4`][] if needed.  

### ::: ImGui::ImColor

##### ::: ImGui::ImColor.value

FIXME-OBSOLETE: May need to obsolete/cleanup those helpers.  

