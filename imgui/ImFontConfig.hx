package imgui;

@:native("ImFontConfig")
extern class ImFontConfig
{
    //public function FontData():Null<DataView>;
    public function FontDataOwnedByAtlas():Bool;
    public function FontNo():Int;
    public function SizePixels():Float;
    public function OversampleH():Float;
    public function OversampleV():Float;
    public function PixelSnapH():Bool;
    public function GlyphExtraSpacing():ImVec2;
    public function GlyphOffset():ImVec2;
    public function GlyphRanges():Null<Float>;
    public function GlyphMinAdvanceX():Float;
    public function GlyphMaxAdvanceX():Float;
    public function MergeMode():Bool;
    public function RasterizerFlags():Int;
    public function RasterizerMultiply():Float;
    public function Name():String;
    public function Name(value:String):Void;
    public function DstFont():ImFont;
}