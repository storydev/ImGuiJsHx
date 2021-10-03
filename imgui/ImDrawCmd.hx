package imgui;

import imgui.ImGui.ImVec4;

@:native("ImDrawCmd")
extern class ImDrawCmd
{
    public function ElemCount():Float;
    public function ClipRect():ImVec4;
    public function TextureId():UInt;
    public function VtxOffset():Int;
    public function IdxOffset():Int;
}