# Basic types

[`ImVec2`][ImGui::ImVec2]: 2D vector used to store positions, sizes etc. [Compile-time configurable type]  
This is a frequently used type in the API. Consider using IM_VEC2_CLASS_EXTRA to create implicit cast from/to our preferred type.  

### ::: ImGui::ImVec2

##### ::: ImGui::ImVec2.x

##### ::: ImGui::ImVec2.y

 We very rarely use this [] operator, the assert overhead is fine.  
 We very rarely use this [] operator, the assert overhead is fine.  

 Define additional constructors and implicit cast operators in imconfig.h to convert back and forth between your math types and [`ImVec2`][ImGui::ImVec2].  

[`ImVec4`][ImGui::ImVec4]: 4D vector used to store clipping rectangles, colors etc. [Compile-time configurable type]  

### ::: ImGui::ImVec4

##### ::: ImGui::ImVec4.x

##### ::: ImGui::ImVec4.y

##### ::: ImGui::ImVec4.z

##### ::: ImGui::ImVec4.w

 Define additional constructors and implicit cast operators in imconfig.h to convert back and forth between your math types and [`ImVec4`][ImGui::ImVec4].  

