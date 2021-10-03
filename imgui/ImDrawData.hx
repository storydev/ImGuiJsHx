package imgui;

import imgui.ImGui.ImVec2;

@:native("ImDrawData")
extern class ImDrawData
{
    public function IterateDrawLists(callback:(ImDrawList) -> Void):Void;
    public function Valid():Bool;
    public function CmdListsCount():Int;
    public function TotalIdxCount():Int;
    public function TotalVtxCount():Int;
    public function DisplayPos():ImVec2;
    public function DisplaySize():ImVec2;
    public function FramebufferScale():ImVec2;
    public function DeIndexAllBuffers():Void;
    public function ScaleClipRects(fb_scale:ImVec2):Void;
}