package imgui;

import imgui.ImGui.ImVec2;
import imgui.ImGui.ImVec4;
import imgui.ImGui.ImDrawCornerFlags;

@:native("ImDrawList")
extern class ImDrawList
{
    public function PushClipRect(clip_rect_min:ImVec2, clip_rect_max:ImVec2, intersect_with_current_clip_rect:Bool = false):Void;
    public function PushClipRectFullScreen():Void;
    public function PopClipRect():Void;
    public function PushTextureID(texture_id:UInt):Void;
    public function PopTextureID():Void;
    public function GetClipRectMin(out:ImVec2):ImVec2;
    public function GetClipRectMax(out:ImVec2):ImVec2;

    public function AddLine(a:ImVec2, b:ImVec2, col:Int, thickness:Float = 1.0):Void;
    public function AddRect(a:ImVec2, b:ImVec2, col:Int, rounding:Float = 0.0, rounding_corners_flags:Int = 15, ?thickness:Float):Void;
    public function AddRectFilled(a:ImVec2, b:ImVec2, col:UInt, ?rounding:Float, ?rounding_corners_flags:Int):Void;
    public function AddRectFilledMultiColor(a:ImVec2, b:ImVec2, col_upr_left:UInt, col_upr_right:UInt, col_bot_right:UInt, col_bot_left:UInt):Void;
    public function AddQuad(a:ImVec2, b:ImVec2, c:ImVec2, d:ImVec2, col:UInt, ?thickness:Float):Void;
    public function AddQuadFilled(a:ImVec2, b:ImVec2, c:ImVec2, d:ImVec2, col:UInt):Void;
    public function AddTriangle(a:ImVec2, b:ImVec2, c:ImVec2, col:UInt, ?thickness:Float):Void;
    public function AddTriangleFilled(a:ImVec2, b:ImVec2, c:ImVec2, col:UInt):Void;
    public function AddCircle(centre:ImVec2, radius:Float, col:UInt, ?num_segments:Float, ?thickness:Float):Void;
    public function AddCircleFilled(centre:ImVec2, radius:Float, col:UInt, ?num_segments:Float):Void;
    public function AddNgon(centre:ImVec2, radius:Float, col:UInt, num_segments:Float, ?thickness:Float):Void;
    public function AddNgonFilled(centre:ImVec2, radius:Float, col:UInt, num_segments:Float):Void;
    public function AddText(pos:ImVec2, col:UInt, text_begin:String, ?text_end:Null<Float>):Void;
    //AddText(font: ImFont, font_size: number, pos: Readonly<Bind.interface_ImVec2>, col: Bind.ImU32, text_begin: string, text_end?: number | null, wrap_width?: number, cpu_fine_clip_rect?: Readonly<Bind.interface_ImVec4> | null): void;
    public function AddPolyline(points:Array<ImVec2>, num_points:Float, col:UInt, closed:Bool, thickness:Float):Void;
    public function AddConvexPolyFilled(points:Array<ImVec2>, num_points:Float, col:UInt):Void;
    public function AddBezierCubic(p1:ImVec2, p2:ImVec2, p3:ImVec2, p4:ImVec2, col:UInt, ?thickness:Float, ?num_segments:Float):Void;
    public function AddBezierQuadratic(p1:ImVec2, p2:ImVec2, p3:ImVec2, col:UInt, ?thickness:Float, ?num_segments:Float):Void;
    public function AddImage(user_texture_id:UInt, a:ImVec2, b:ImVec2, ?uv_a:ImVec2, ?uv_b:ImVec2, ?col:UInt):Void;
    public function AddImageQuad(user_texture_id:UInt, a:ImVec2, b:ImVec2, c:ImVec2, d:ImVec2, ?uv_a:ImVec2, ?uv_b:ImVec2, ?uv_c:ImVec2, ?uv_d:ImVec2, ?col:UInt):Void;
    public function AddImageRounded(user_texture_id:UInt, a:ImVec2, b:ImVec2, uv_a:ImVec2, uv_b:ImVec2, col:UInt, rounding:Float, ?rounding_corners:ImDrawCornerFlags):Void;
    public function PathClear():Void;
    public function PathLineTo(pos:ImVec2):Void;
    public function PathLineToMergeDuplicate(pos:ImVec2):Void;
    public function PathFillConvex(col:UInt):Void;
    public function PathStroke(col:UInt, closed:Bool, ?thickness:Float):Void;
    public function PathArcTo(centre:ImVec2, radius:Float, a_min:Float, a_max:Float, ?num_segments:Float):Void;
    public function PathArcToFast(centre:ImVec2, radius:Float, a_min_of_12:Float, a_max_of_12:Float):Void;
    public function PathBezierCubicCurveTo(p2:ImVec2, p3:ImVec2, p4:ImVec2, ?num_segments:Float):Void;
    public function PathBezierQuadraticCurveTo(p2:ImVec2, p3:ImVec2, ?num_segments:Float):Void;
    public function PathRect(rect_min:ImVec2, rect_max:ImVec2, ?rounding:Float, ?rounding_corners_flags:ImDrawCornerFlags):Void;
    public function ChannelsSplit(channels_count:Float):Void;
    public function ChannelsMerge():Void;
    public function ChannelsSetCurrent(channel_index:Float):Void;
    public function AddCallback(callback:(ImDrawList, ImDrawCmd) -> Void, callback_data:Dynamic):Void;
    public function AddDrawCmd():Void;
    public function PrimReserve(idx_count:Float, vtx_count:Float):Void;
    public function PrimUnreserve(idx_count:Float, vtx_count:Float):Void;
    public function PrimRect(a:ImVec2, b:ImVec2, col:UInt):Void;
    public function PrimRectUV(a:ImVec2, b:ImVec2, uv_a:ImVec2, uv_b:ImVec2, col:UInt):Void;
    public function PrimQuadUV(a:ImVec2, b:ImVec2, c:ImVec2, d:ImVec2, uv_a:ImVec2, uv_b:ImVec2, uv_c:ImVec2, uv_d:ImVec2, col:UInt):Void;
    public function PrimWriteVtx(pos:ImVec2, uv:ImVec2, col:UInt):Void;
    public function PrimWriteIdx(idx:Int):Void;
    public function PrimVtx(pos:ImVec2, uv:ImVec2, col:UInt):Void;
}