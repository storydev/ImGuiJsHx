package imgui;

import imgui.ImGui.ImGuiInputTextFlags;
import imgui.ImGui.ImGuiKey;

@:native("ImGuiInputTextCallbackData")
extern class ImGuiInputTextCallbackData<T>
{
    public function EventFlag():ImGuiInputTextFlags;
    public function Flags(): ImGuiInputTextFlags;
    @:overload(function(value:UInt):Void {})
    public function EventChar():UInt;

    public function EventKey():ImGuiKey;

    @:overload(function(value:String):Void {})
    public function Buf():String;

    @:overload(function(value:Int):Void {})
    public function BufTextLen():Int;

    public function BufSize():Int;
    public function BufDirty(value:Bool):Void;

    @:overload(function(value:Int):Void {})
    public function CursorPos():Int;

    @:overload(function(value:Int):Void {})
    public function SelectionStart():Int;

    @:overload(function(value:Int):Void {})
    public function SelectionEnd():Int;

    public function DeleteChars(pos:Int, bytes_count:Int):Void;
    public function InsertChars(pos:Int, text:String, ?text_end:Int):Void;
    public function SelectAll():Void;
    public function ClearSelection():Void;
    public function HasSelection():Bool;
}