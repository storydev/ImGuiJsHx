package imgui;

@:native("Context")
extern class Context
{
    public function new();
    public var RenderCallback:Void -> Void;
    public var InitCallback:Void -> Void;
}