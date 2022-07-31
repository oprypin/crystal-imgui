# Misc data structures  

Shared state of [`ImGui.input_text`][], passed as an argument to your callback when a ImGuiInputTextFlags_Callback* flag is used.  
The callback function should return 0 by default.  
Callbacks (follow a flag name and see comments in [`ImGui::ImGuiInputTextFlags`][] declarations for more details)  

- ImGuiInputTextFlags_CallbackEdit:        Callback on buffer edit (note that [`ImGui.input_text`][] already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
- ImGuiInputTextFlags_CallbackAlways:      Callback on each iteration
- ImGuiInputTextFlags_CallbackCompletion:  Callback on pressing TAB
- ImGuiInputTextFlags_CallbackHistory:     Callback on pressing Up/Down arrows
- ImGuiInputTextFlags_CallbackCharFilter:  Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
- ImGuiInputTextFlags_CallbackResize:      Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing the string to grow.

### ::: ImGui::ImGuiInputTextCallbackData

##### ::: ImGui::ImGuiInputTextCallbackData.event_flag

 One ImGuiInputTextFlags_Callback*    // Read-only  

##### ::: ImGui::ImGuiInputTextCallbackData.flags

 What user passed to [`ImGui.input_text`][]      // Read-only  

##### ::: ImGui::ImGuiInputTextCallbackData.user_data

 What user passed to [`ImGui.input_text`][]      // Read-only  

#### Arguments for the different callback events  

- To modify the text buffer in a callback, prefer using the InsertChars() / DeleteChars() function. InsertChars() will take care of calling the resize callback if necessary.
- If you know your edits are not going to resize the underlying buffer allocation, you may modify the contents of 'Buf[]' directly. You need to update 'BufTextLen' accordingly (0 <= BufTextLen < BufSize) and set 'BufDirty'' to true so [`ImGui.input_text`][] can update its internal state.

##### ::: ImGui::ImGuiInputTextCallbackData.event_char

 Character input                      // Read-write   // [CharFilter] Replace character with another one, or set to zero to drop. return 1 is equivalent to setting EventChar=0;  

##### ::: ImGui::ImGuiInputTextCallbackData.event_key

 Key pressed (Up/Down/TAB)            // Read-only    // [Completion,History]  

##### ::: ImGui::ImGuiInputTextCallbackData.buf

 [`ImGui.text`][] buffer                          // Read-write   // [Resize] Can replace pointer / [Completion,History,Always] Only write to pointed data, don't replace the actual pointer!  

##### ::: ImGui::ImGuiInputTextCallbackData.buf_text_len

 [`ImGui.text`][] length (in bytes)               // Read-write   // [Resize,Completion,History,Always] Exclude zero-terminator storage. In C land: == strlen(some_text), in C++ land: string.length()  

##### ::: ImGui::ImGuiInputTextCallbackData.buf_size

 Buffer size (in bytes) = capacity+1  // Read-only    // [Resize,Completion,History,Always] Include zero-terminator storage. In C land == ARRAYSIZE(my_char_array), in C++ land: string.capacity()+1  

##### ::: ImGui::ImGuiInputTextCallbackData.buf_dirty

 Set if you modify Buf/BufTextLen!    // Write        // [Completion,History,Always]  

##### ::: ImGui::ImGuiInputTextCallbackData.cursor_pos

                                      // Read-write   // [Completion,History,Always]

##### ::: ImGui::ImGuiInputTextCallbackData.selection_start

                                      // Read-write   // [Completion,History,Always] == to SelectionEnd when no selection)

##### ::: ImGui::ImGuiInputTextCallbackData.selection_end

                                      // Read-write   // [Completion,History,Always]

Helper functions for text manipulation.  
Use those function to benefit from the CallbackResize behaviors. Calling those function reset the selection.  

Resizing callback data to apply custom constraint. As enabled by [`ImGui.set_next_window_size_constraints`][]. Callback is called during the next [`ImGui.begin`][].  
NB: For basic min/max size constraint on each axis you don't need to use the callback! The [`ImGui.set_next_window_size_constraints`][] parameters are enough.  

### ::: ImGui::ImGuiSizeCallbackData

##### ::: ImGui::ImGuiSizeCallbackData.user_data

 Read-only.   What user passed to [`ImGui.set_next_window_size_constraints`][]  

##### ::: ImGui::ImGuiSizeCallbackData.pos

 Read-only.   Window position, for reference.  

##### ::: ImGui::ImGuiSizeCallbackData.current_size

 Read-only.   Current window size.  

##### ::: ImGui::ImGuiSizeCallbackData.desired_size

 Read-write.  Desired size, based on user's mouse position. Write to this field to restrain resizing.  

## Data payload for Drag and Drop operations: [`ImGui.accept_drag_drop_payload`][], [`ImGui.get_drag_drop_payload`][]  

### ::: ImGui::ImGuiPayload

#### Members  

##### ::: ImGui::ImGuiPayload.data

 Data (copied and owned by dear imgui)  

##### ::: ImGui::ImGuiPayload.data_size

 Data size  

#### [Internal]  

##### ::: ImGui::ImGuiPayload.source_id

 Source item id  

##### ::: ImGui::ImGuiPayload.source_parent_id

 Source parent id (if available)  

##### ::: ImGui::ImGuiPayload.data_frame_count

 Data timestamp  

##### ::: ImGui::ImGuiPayload.data_type

 Data type tag (short user-supplied string, 32 characters max)  

##### ::: ImGui::ImGuiPayload.preview

 Set when [`ImGui.accept_drag_drop_payload`][] was called and mouse has been hovering the target item (nb: handle overlapping drag targets)  

##### ::: ImGui::ImGuiPayload.delivery

 Set when [`ImGui.accept_drag_drop_payload`][] was called and mouse button is released over the target item.  

## Sorting specification for one column of a table (sizeof == 12 bytes)  

### ::: ImGui::ImGuiTableColumnSortSpecs

##### ::: ImGui::ImGuiTableColumnSortSpecs.column_user_id

 User id of the column (if specified by a [`ImGui.table_setup_column`][] call)  

##### ::: ImGui::ImGuiTableColumnSortSpecs.column_index

 Index of the column  

##### ::: ImGui::ImGuiTableColumnSortSpecs.sort_order

 Index within parent [`ImGui::ImGuiTableSortSpecs`][] (always stored in order starting from 0, tables sorted on a single criteria will always have a 0 here)  

##### ::: ImGui::ImGuiTableColumnSortSpecs.sort_direction

 ImGuiSortDirection_Ascending or ImGuiSortDirection_Descending (you can use this or SortSign, whichever is more convenient for your sort function)  

## Sorting specifications for a table (often handling sort specs for a single column, occasionally more)  
Obtained by calling [`ImGui.table_get_sort_specs`][].  
When 'SpecsDirty == true' you can sort your data. It will be true with sorting specs have changed since last call, or the first time.  
Make sure to set 'SpecsDirty = false' after sorting, else you may wastefully sort your data every frame!  

### ::: ImGui::ImGuiTableSortSpecs

##### ::: ImGui::ImGuiTableSortSpecs.specs

 Pointer to sort spec array.  

##### ::: ImGui::ImGuiTableSortSpecs.specs_count

 Sort spec count. Most often 1. May be > 1 when ImGuiTableFlags_SortMulti is enabled. May be == 0 when ImGuiTableFlags_SortTristate is enabled.  

##### ::: ImGui::ImGuiTableSortSpecs.specs_dirty

 Set to true when specs have changed since last time! Use this to sort again, then clear the flag.  

