package imgui;

import haxe.extern.EitherType;

import js.Syntax;

enum abstract ImGuiWindowFlags(Int) from Int to Int
{
    var ImGuiWindowFlags_None                   = 0;
    var ImGuiWindowFlags_NoTitleBar             = 1 << 0;   // Disable title-bar
    var ImGuiWindowFlags_NoResize               = 1 << 1;   // Disable user resizing with the lower-right grip
    var ImGuiWindowFlags_NoMove                 = 1 << 2;   // Disable user moving the window
    var ImGuiWindowFlags_NoScrollbar            = 1 << 3;   // Disable scrollbars (window can still scroll with mouse or programmatically)
    var ImGuiWindowFlags_NoScrollWithMouse      = 1 << 4;   // Disable user vertically scrolling with mouse wheel. On child window, mouse wheel will be forwarded to the parent unless NoScrollbar is also set.
    var ImGuiWindowFlags_NoCollapse             = 1 << 5;   // Disable user collapsing window by double-clicking on it
    var ImGuiWindowFlags_AlwaysAutoResize       = 1 << 6;   // Resize every window to its content every frame
    var ImGuiWindowFlags_NoBackground           = 1 << 7;   // Disable drawing background color (WindowBg, etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
    var ImGuiWindowFlags_NoSavedSettings        = 1 << 8;   // Never load/save settings in .ini file
    var ImGuiWindowFlags_NoMouseInputs          = 1 << 9;   // Disable catching mouse, hovering test with pass through.
    var ImGuiWindowFlags_MenuBar                = 1 << 10;  // Has a menu-bar
    var ImGuiWindowFlags_HorizontalScrollbar    = 1 << 11;  // Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width,0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
    var ImGuiWindowFlags_NoFocusOnAppearing     = 1 << 12;  // Disable taking focus when transitioning from hidden to visible state
    var ImGuiWindowFlags_NoBringToFrontOnFocus  = 1 << 13;  // Disable bringing window to front when taking focus (e.g. clicking on it or programmatically giving it focus)
    var ImGuiWindowFlags_AlwaysVerticalScrollbar= 1 << 14;  // Always show vertical scrollbar (even if ContentSize.y < Size.y)
    var ImGuiWindowFlags_AlwaysHorizontalScrollbar=1<< 15;  // Always show horizontal scrollbar (even if ContentSize.x < Size.x)
    var ImGuiWindowFlags_AlwaysUseWindowPadding = 1 << 16;  // Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows, because more convenient)
    var ImGuiWindowFlags_NoNavInputs            = 1 << 18;  // No gamepad/keyboard navigation within the window
    var ImGuiWindowFlags_NoNavFocus             = 1 << 19;  // No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
    var ImGuiWindowFlags_UnsavedDocument        = 1 << 20;  // Display a dot next to the title. When used in a tab/docking context, tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
    var ImGuiWindowFlags_NoNav                  = ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus;
    var ImGuiWindowFlags_NoDecoration           = ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse;
    var ImGuiWindowFlags_NoInputs               = ImGuiWindowFlags_NoMouseInputs | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus;
}

enum abstract ImGuiInputTextFlags(Int) from Int to Int
{
    var ImGuiInputTextFlags_None                = 0;
    var ImGuiInputTextFlags_CharsDecimal        = 1 << 0;   // Allow 0123456789.+-*/
    var ImGuiInputTextFlags_CharsHexadecimal    = 1 << 1;   // Allow 0123456789ABCDEFabcdef
    var ImGuiInputTextFlags_CharsUppercase      = 1 << 2;   // Turn a..z into A..Z
    var ImGuiInputTextFlags_CharsNoBlank        = 1 << 3;   // Filter out spaces, tabs
    var ImGuiInputTextFlags_AutoSelectAll       = 1 << 4;   // Select entire text when first taking mouse focus
    var ImGuiInputTextFlags_EnterReturnsTrue    = 1 << 5;   // Return 'true' when Enter is pressed (as opposed to every time the value was modified). Consider looking at the IsItemDeactivatedAfterEdit() function.
    var ImGuiInputTextFlags_CallbackCompletion  = 1 << 6;   // Callback on pressing TAB (for completion handling)
    var ImGuiInputTextFlags_CallbackHistory     = 1 << 7;   // Callback on pressing Up/Down arrows (for history handling)
    var ImGuiInputTextFlags_CallbackAlways      = 1 << 8;   // Callback on each iteration. User code may query cursor position, modify text buffer.
    var ImGuiInputTextFlags_CallbackCharFilter  = 1 << 9;   // Callback on character inputs to replace or discard them. Modify 'EventChar' to replace or discard, or return 1 in callback to discard.
    var ImGuiInputTextFlags_AllowTabInput       = 1 << 10;  // Pressing TAB input a '\t' character into the text field
    var ImGuiInputTextFlags_CtrlEnterForNewLine = 1 << 11;  // In multi-line mode, unfocus with Enter, add new line with Ctrl+Enter (default is opposite: unfocus with Ctrl+Enter, add line with Enter).
    var ImGuiInputTextFlags_NoHorizontalScroll  = 1 << 12;  // Disable following the cursor horizontally
    var ImGuiInputTextFlags_AlwaysOverwrite     = 1 << 13;  // Overwrite mode
    var ImGuiInputTextFlags_ReadOnly            = 1 << 14;  // Read-only mode
    var ImGuiInputTextFlags_Password            = 1 << 15;  // Password mode, display all characters as '*'
    var ImGuiInputTextFlags_NoUndoRedo          = 1 << 16;  // Disable undo/redo. Note that input text owns the text data while active, if you want to provide your own undo/redo stack you need e.g. to call ClearActiveID().
    var ImGuiInputTextFlags_CharsScientific     = 1 << 17;  // Allow 0123456789.+-*/eE (Scientific notation input)
    var ImGuiInputTextFlags_CallbackResize      = 1 << 18;  // Callback on buffer capacity changes request (beyond 'buf_size' parameter value), allowing theString to grow. Notify when theString wants to be resized (forString types which hold a cache of their Size). You will be provided a new BufSize in the callback and NEED to honor it. (see misc/cpp/imgui_stdlib.h for an example of using this)
    var ImGuiInputTextFlags_CallbackEdit        = 1 << 19;  // Callback on any edit (note that InputText() already returns true on edit, the callback is useful mainly to manipulate the underlying buffer while focus is active)
}

enum abstract ImGuiTreeNodeFlags(Int) from Int to Int
{
    var ImGuiTreeNodeFlags_None                 = 0;
    var ImGuiTreeNodeFlags_Selected             = 1 << 0;   // Draw as selected
    var ImGuiTreeNodeFlags_Framed               = 1 << 1;   // Draw frame with background (e.g. for CollapsingHeader)
    var ImGuiTreeNodeFlags_AllowItemOverlap     = 1 << 2;   // Hit testing to allow subsequent widgets to overlap this one
    var ImGuiTreeNodeFlags_NoTreePushOnOpen     = 1 << 3;   // Don't do a TreePush() when open (e.g. for CollapsingHeader) = no extra indent nor pushing on ID stack
    var ImGuiTreeNodeFlags_NoAutoOpenOnLog      = 1 << 4;   // Don't automatically and temporarily open node when Logging is active (by default logging will automatically open tree nodes)
    var ImGuiTreeNodeFlags_DefaultOpen          = 1 << 5;   // Default node to be open
    var ImGuiTreeNodeFlags_OpenOnDoubleClick    = 1 << 6;   // Need double-click to open node
    var ImGuiTreeNodeFlags_OpenOnArrow          = 1 << 7;   // Only open when clicking on the arrow part. If ImGuiTreeNodeFlags_OpenOnDoubleClick is also set, single-click arrow or double-click all box to open.
    var ImGuiTreeNodeFlags_Leaf                 = 1 << 8;   // No collapsing, no arrow (use as a convenience for leaf nodes).
    var ImGuiTreeNodeFlags_Bullet               = 1 << 9;   // Display a bullet instead of arrow
    var ImGuiTreeNodeFlags_FramePadding         = 1 << 10;  // Use FramePadding (even for an unframed text node) to vertically align text baseline to regular widget height. Equivalent to calling AlignTextToFramePadding().
    var ImGuiTreeNodeFlags_SpanAvailWidth       = 1 << 11;  // Extend hit box to the right-most edge, even if not framed. This is not the default in order to allow adding other items on the same line. In the future we may refactor the hit system to be front-to-back, allowing natural overlaps and then this can become the default.
    var ImGuiTreeNodeFlags_SpanFullWidth        = 1 << 12;  // Extend hit box to the left-most and right-most edges (bypass the indented area).
    var ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 << 13;  // (WIP) Nav: left direction may move to this TreeNode() from any of its child (items submitted between TreeNode and TreePop)
    //ImGuiTreeNodeFlags_NoScrollOnOpen     = 1 << 14,  // FIXME: TODO: Disable automatic scroll on TreePop() if node got just open and contents is not visible
    var ImGuiTreeNodeFlags_CollapsingHeader     = ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen | ImGuiTreeNodeFlags_NoAutoOpenOnLog;
}

enum abstract ImGuiPopupFlags(Int) from Int to Int
{
    var ImGuiPopupFlags_None                    = 0;
    var ImGuiPopupFlags_MouseButtonLeft         = 0;        // For BeginPopupContext*(): open on Left Mouse release. Guaranteed to always be == 0 (same as ImGuiMouseButton_Left)
    var ImGuiPopupFlags_MouseButtonRight        = 1;        // For BeginPopupContext*(): open on Right Mouse release. Guaranteed to always be == 1 (same as ImGuiMouseButton_Right)
    var ImGuiPopupFlags_MouseButtonMiddle       = 2;        // For BeginPopupContext*(): open on Middle Mouse release. Guaranteed to always be == 2 (same as ImGuiMouseButton_Middle)
    var ImGuiPopupFlags_MouseButtonMask_        = 0x1F;
    var ImGuiPopupFlags_MouseButtonDefault_     = 1;
    var ImGuiPopupFlags_NoOpenOverExistingPopup = 1 << 5;   // For OpenPopup*(), BeginPopupContext*(): don't open if there's already a popup at the same level of the popup stack
    var ImGuiPopupFlags_NoOpenOverItems         = 1 << 6;   // For BeginPopupContextWindow(): don't return true when hovering items, only when hovering empty space
    var ImGuiPopupFlags_AnyPopupId              = 1 << 7;   // For IsPopupOpen(): ignore the ImGuiID parameter and test for any popup.
    var ImGuiPopupFlags_AnyPopupLevel           = 1 << 8;   // For IsPopupOpen(): search/test at any level of the popup stack (default test in the current level)
    var ImGuiPopupFlags_AnyPopup                = ImGuiPopupFlags_AnyPopupId | ImGuiPopupFlags_AnyPopupLevel;
}

enum abstract ImGuiSelectableFlag(Int) from Int to Int
{
    var ImGuiSelectableFlags_None               = 0;
    var ImGuiSelectableFlags_DontClosePopups    = 1 << 0;   // Clicking this don't close parent popup window
    var ImGuiSelectableFlags_SpanAllColumns     = 1 << 1;   // Selectable frame can span all columns (text will still fit in current column)
    var ImGuiSelectableFlags_AllowDoubleClick   = 1 << 2;   // Generate press events on double clicks too
    var ImGuiSelectableFlags_Disabled           = 1 << 3;   // Cannot be selected, display grayed out text
    var ImGuiSelectableFlags_AllowItemOverlap   = 1 << 4;   // (WIP) Hit testing to allow subsequent widgets to overlap this one
}

enum abstract ImGuiComboFlags(Int) from Int to Int
{
    var ImGuiComboFlags_None                    = 0;
    var ImGuiComboFlags_PopupAlignLeft          = 1 << 0;   // Align the popup toward the left by default
    var ImGuiComboFlags_HeightSmall             = 1 << 1;   // Max ~4 items visible. Tip: If you want your combo popup to be a specific size you can use SetNextWindowSizeConstraints() prior to calling BeginCombo()
    var ImGuiComboFlags_HeightRegular           = 1 << 2;   // Max ~8 items visible (default)
    var ImGuiComboFlags_HeightLarge             = 1 << 3;   // Max ~20 items visible
    var ImGuiComboFlags_HeightLargest           = 1 << 4;   // As many fitting items as possible
    var ImGuiComboFlags_NoArrowButton           = 1 << 5;   // Display on the preview box without the square arrow button
    var ImGuiComboFlags_NoPreview               = 1 << 6;   // Display only a square arrow button
    var ImGuiComboFlags_HeightMask_             = ImGuiComboFlags_HeightSmall | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge | ImGuiComboFlags_HeightLargest;
}

enum abstract ImGuiTabBarFlags(Int) from Int to Int
{
    var ImGuiTabBarFlags_None                           = 0;
    var ImGuiTabBarFlags_Reorderable                    = 1 << 0;   // Allow manually dragging tabs to re-order them + New tabs are appended at the end of list
    var ImGuiTabBarFlags_AutoSelectNewTabs              = 1 << 1;   // Automatically select new tabs when they appear
    var ImGuiTabBarFlags_TabListPopupButton             = 1 << 2;   // Disable buttons to open the tab list popup
    var ImGuiTabBarFlags_NoCloseWithMiddleMouseButton   = 1 << 3;   // Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
    var ImGuiTabBarFlags_NoTabListScrollingButtons      = 1 << 4;   // Disable scrolling buttons (apply when fitting policy is ImGuiTabBarFlags_FittingPolicyScroll)
    var ImGuiTabBarFlags_NoTooltip                      = 1 << 5;   // Disable tooltips when hovering a tab
    var ImGuiTabBarFlags_FittingPolicyResizeDown        = 1 << 6;   // Resize tabs when they don't fit
    var ImGuiTabBarFlags_FittingPolicyScroll            = 1 << 7;   // Add scroll buttons when tabs don't fit
    var ImGuiTabBarFlags_FittingPolicyMask_             = ImGuiTabBarFlags_FittingPolicyResizeDown | ImGuiTabBarFlags_FittingPolicyScroll;
    var ImGuiTabBarFlags_FittingPolicyDefault_          = ImGuiTabBarFlags_FittingPolicyResizeDown;
}

enum abstract ImGuiTabItemFlags(Int) from Int to Int
{
    var ImGuiTabItemFlags_None                          = 0;
    var ImGuiTabItemFlags_UnsavedDocument               = 1 << 0;   // Display a dot next to the title + tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X, so if you keep submitting the tab may reappear at end of tab bar.
    var ImGuiTabItemFlags_SetSelected                   = 1 << 1;   // Trigger flag to programmatically make the tab selected when calling BeginTabItem()
    var ImGuiTabItemFlags_NoCloseWithMiddleMouseButton  = 1 << 2;   // Disable behavior of closing tabs (that are submitted with p_open != NULL) with middle mouse button. You can still repro this behavior on user's side with if (IsItemHovered() && IsMouseClicked(2)) *p_open = false.
    var ImGuiTabItemFlags_NoPushId                      = 1 << 3;   // Don't call PushID(tab->ID)/PopID() on BeginTabItem()/EndTabItem()
    var ImGuiTabItemFlags_NoTooltip                     = 1 << 4;   // Disable tooltip for the given tab
    var ImGuiTabItemFlags_NoReorder                     = 1 << 5;   // Disable reordering this tab or having another tab cross over this tab
    var ImGuiTabItemFlags_Leading                       = 1 << 6;   // Enforce the tab position to the left of the tab bar (after the tab list popup button)
    var ImGuiTabItemFlags_Trailing                      = 1 << 7;   // Enforce the tab position to the right of the tab bar (before the scrolling buttons)
}

enum abstract ImGuiTableFlags(Int) from Int to Int
{
    // Features
    var ImGuiTableFlags_None                       = 0;
    var ImGuiTableFlags_Resizable                  = 1 << 0;   // Enable resizing columns.
    var ImGuiTableFlags_Reorderable                = 1 << 1;   // Enable reordering columns in header row (need calling TableSetupColumn() + TableHeadersRow() to display headers)
    var ImGuiTableFlags_Hideable                   = 1 << 2;   // Enable hiding/disabling columns in context menu.
    var ImGuiTableFlags_Sortable                   = 1 << 3;   // Enable sorting. Call TableGetSortSpecs() to obtain sort specs. Also see ImGuiTableFlags_SortMulti and ImGuiTableFlags_SortTristate.
    var ImGuiTableFlags_NoSavedSettings            = 1 << 4;   // Disable persisting columns order, width and sort settings in the .ini file.
    var ImGuiTableFlags_ContextMenuInBody          = 1 << 5;   // Right-click on columns body/contents will display table context menu. By default it is available in TableHeadersRow().
    // Decorations
    var ImGuiTableFlags_RowBg                      = 1 << 6;   // Set each RowBg color with ImGuiCol_TableRowBg or ImGuiCol_TableRowBgAlt (equivalent of calling TableSetBgColor with ImGuiTableBgFlags_RowBg0 on each row manually)
    var ImGuiTableFlags_BordersInnerH              = 1 << 7;   // Draw horizontal borders between rows.
    var ImGuiTableFlags_BordersOuterH              = 1 << 8;   // Draw horizontal borders at the top and bottom.
    var ImGuiTableFlags_BordersInnerV              = 1 << 9;   // Draw vertical borders between columns.
    var ImGuiTableFlags_BordersOuterV              = 1 << 10;  // Draw vertical borders on the left and right sides.
    var ImGuiTableFlags_BordersH                   = ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH; // Draw horizontal borders.
    var ImGuiTableFlags_BordersV                   = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersOuterV; // Draw vertical borders.
    var ImGuiTableFlags_BordersInner               = ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH; // Draw inner borders.
    var ImGuiTableFlags_BordersOuter               = ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH; // Draw outer borders.
    var ImGuiTableFlags_Borders                    = ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter;   // Draw all borders.
    var ImGuiTableFlags_NoBordersInBody            = 1 << 11;  // [ALPHA] Disable vertical borders in columns Body (borders will always appears in Headers). -> May move to style
    var ImGuiTableFlags_NoBordersInBodyUntilResize = 1 << 12;  // [ALPHA] Disable vertical borders in columns Body until hovered for resize (borders will always appears in Headers). -> May move to style
    // Sizing Policy (read above for defaults)
    var ImGuiTableFlags_SizingFixedFit             = 1 << 13;  // Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching contents width.
    var ImGuiTableFlags_SizingFixedSame            = 2 << 13;  // Columns default to _WidthFixed or _WidthAuto (if resizable or not resizable), matching the maximum contents width of all columns. Implicitly enable ImGuiTableFlags_NoKeepColumnsVisible.
    var ImGuiTableFlags_SizingStretchProp          = 3 << 13;  // Columns default to _WidthStretch with default weights proportional to each columns contents widths.
    var ImGuiTableFlags_SizingStretchSame          = 4 << 13;  // Columns default to _WidthStretch with default weights all equal, unless overridden by TableSetupColumn().
    // Sizing Extra Options
    var ImGuiTableFlags_NoHostExtendX              = 1 << 16;  // Make outer width auto-fit to columns, overriding outer_size.x value. Only available when ScrollX/ScrollY are disabled and Stretch columns are not used.
    var ImGuiTableFlags_NoHostExtendY              = 1 << 17;  // Make outer height stop exactly at outer_size.y (prevent auto-extending table past the limit). Only available when ScrollX/ScrollY are disabled. Data below the limit will be clipped and not visible.
    var ImGuiTableFlags_NoKeepColumnsVisible       = 1 << 18;  // Disable keeping column always minimally visible when ScrollX is off and table gets too small. Not recommended if columns are resizable.
    var ImGuiTableFlags_PreciseWidths              = 1 << 19;  // Disable distributing remainder width to stretched columns (width allocation on a 100-wide table with 3 columns: Without this flag: 33,33,34. With this flag: 33,33,33). With larger number of columns, resizing will appear to be less smooth.
    // Clipping
    var ImGuiTableFlags_NoClip                     = 1 << 20;  // Disable clipping rectangle for every individual columns (reduce draw command count, items will be able to overflow into other columns). Generally incompatible with TableSetupScrollFreeze().
    // Padding
    var ImGuiTableFlags_PadOuterX                  = 1 << 21;  // Default if BordersOuterV is on. Enable outer-most padding. Generally desirable if you have headers.
    var ImGuiTableFlags_NoPadOuterX                = 1 << 22;  // Default if BordersOuterV is off. Disable outer-most padding.
    var ImGuiTableFlags_NoPadInnerX                = 1 << 23;  // Disable inner padding between columns (double inner padding if BordersOuterV is on, single inner padding if BordersOuterV is off).
    // Scrolling
    var ImGuiTableFlags_ScrollX                    = 1 << 24;  // Enable horizontal scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size. Changes default sizing policy. Because this create a child window, ScrollY is currently generally recommended when using ScrollX.
    var ImGuiTableFlags_ScrollY                    = 1 << 25;  // Enable vertical scrolling. Require 'outer_size' parameter of BeginTable() to specify the container size.
    // Sorting
    var ImGuiTableFlags_SortMulti                  = 1 << 26;  // Hold shift when clicking headers to sort on multiple column. TableGetSortSpecs() may return specs where (SpecsCount > 1).
    var ImGuiTableFlags_SortTristate               = 1 << 27;  // Allow no sorting, disable default sorting. TableGetSortSpecs() may return specs where (SpecsCount == 0).
}

enum abstract ImGuiTableColumnFlags(Int) from Int to Int
{
    // Input configuration flags
    var ImGuiTableColumnFlags_None                  = 0;
    var ImGuiTableColumnFlags_Disabled              = 1 << 0;   // Overriding/master disable flag: hide column, won't show in context menu (unlike calling TableSetColumnEnabled() which manipulates the user accessible state)
    var ImGuiTableColumnFlags_DefaultHide           = 1 << 1;   // Default as a hidden/disabled column.
    var ImGuiTableColumnFlags_DefaultSort           = 1 << 2;   // Default as a sorting column.
    var ImGuiTableColumnFlags_WidthStretch          = 1 << 3;   // Column will stretch. Preferable with horizontal scrolling disabled (default if table sizing policy is _SizingStretchSame or _SizingStretchProp).
    var ImGuiTableColumnFlags_WidthFixed            = 1 << 4;   // Column will not stretch. Preferable with horizontal scrolling enabled (default if table sizing policy is _SizingFixedFit and table is resizable).
    var ImGuiTableColumnFlags_NoResize              = 1 << 5;   // Disable manual resizing.
    var ImGuiTableColumnFlags_NoReorder             = 1 << 6;   // Disable manual reordering this column, this will also prevent other columns from crossing over this column.
    var ImGuiTableColumnFlags_NoHide                = 1 << 7;   // Disable ability to hide/disable this column.
    var ImGuiTableColumnFlags_NoClip                = 1 << 8;   // Disable clipping for this column (all NoClip columns will render in a same draw command).
    var ImGuiTableColumnFlags_NoSort                = 1 << 9;   // Disable ability to sort on this field (even if ImGuiTableFlags_Sortable is set on the table).
    var ImGuiTableColumnFlags_NoSortAscending       = 1 << 10;  // Disable ability to sort in the ascending direction.
    var ImGuiTableColumnFlags_NoSortDescending      = 1 << 11;  // Disable ability to sort in the descending direction.
    var ImGuiTableColumnFlags_NoHeaderLabel         = 1 << 12;  // TableHeadersRow() will not submit label for this column. Convenient for some small columns. Name will still appear in context menu.
    var ImGuiTableColumnFlags_NoHeaderWidth         = 1 << 13;  // Disable header text width contribution to automatic column width.
    var ImGuiTableColumnFlags_PreferSortAscending   = 1 << 14;  // Make the initial sort direction Ascending when first sorting on this column (default).
    var ImGuiTableColumnFlags_PreferSortDescending  = 1 << 15;  // Make the initial sort direction Descending when first sorting on this column.
    var ImGuiTableColumnFlags_IndentEnable          = 1 << 16;  // Use current Indent value when entering cell (default for column 0).
    var ImGuiTableColumnFlags_IndentDisable         = 1 << 17;  // Ignore current Indent value when entering cell (default for columns > 0). Indentation changes _within_ the cell will still be honored.

    // Output status flags, read-only via TableGetColumnFlags()
    var ImGuiTableColumnFlags_IsEnabled             = 1 << 24;  // Status: is enabled == not hidden by user/api (referred to as "Hide" in _DefaultHide and _NoHide) flags.
    var ImGuiTableColumnFlags_IsVisible             = 1 << 25;  // Status: is visible == is enabled AND not clipped by scrolling.
    var ImGuiTableColumnFlags_IsSorted              = 1 << 26;  // Status: is currently part of the sort specs
    var ImGuiTableColumnFlags_IsHovered             = 1 << 27;  // Status: is hovered by mouse
}

enum abstract ImGuiTableRowFlags(Int) from Int to Int
{
    var ImGuiTableRowFlags_None                         = 0;
    var ImGuiTableRowFlags_Headers                      = 1 << 0;    // Identify header row (set default background color + width of its contents accounted different for auto column width)
}

enum abstract ImGuiTableBgTarget(Int) from Int to Int
{
    var ImGuiTableBgTarget_None                         = 0;
    var ImGuiTableBgTarget_RowBg0                       = 1;        // Set row background color 0 (generally used for background, automatically set when ImGuiTableFlags_RowBg is used)
    var ImGuiTableBgTarget_RowBg1                       = 2;        // Set row background color 1 (generally used for selection marking)
    var ImGuiTableBgTarget_CellBg                       = 3;        // Set cell background color (top-most color)
}

enum abstract ImGuiFocusedFlags(Int) from Int to Int
{
    var ImGuiFocusedFlags_None                          = 0;
    var ImGuiFocusedFlags_ChildWindows                  = 1 << 0;   // Return true if any children of the window is focused
    var ImGuiFocusedFlags_RootWindow                    = 1 << 1;   // Test from root window (top most parent of the current hierarchy)
    var ImGuiFocusedFlags_AnyWindow                     = 1 << 2;   // Return true if any window is focused. Important: If you are trying to tell how to dispatch your low-level inputs, do NOT use this. Use 'io.WantCaptureMouse' instead! Please read the FAQ!
    var ImGuiFocusedFlags_NoPopupHierarchy              = 1 << 3;   // Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)
    //ImGuiFocusedFlags_DockHierarchy               = 1 << 4,   // Consider docking hierarchy (treat dockspace host as parent of docked window) (when used with _ChildWindows or _RootWindow)
    var ImGuiFocusedFlags_RootAndChildWindows           = ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows;
}

enum abstract ImGuiHoveredFlags(Int) from Int to Int
{
    var ImGuiHoveredFlags_None                          = 0;        // Return true if directly over the item/window, not obstructed by another window, not obstructed by an active popup or modal blocking inputs under them.
    var ImGuiHoveredFlags_ChildWindows                  = 1 << 0;   // IsWindowHovered() only: Return true if any children of the window is hovered
    var ImGuiHoveredFlags_RootWindow                    = 1 << 1;   // IsWindowHovered() only: Test from root window (top most parent of the current hierarchy)
    var ImGuiHoveredFlags_AnyWindow                     = 1 << 2;   // IsWindowHovered() only: Return true if any window is hovered
    var ImGuiHoveredFlags_NoPopupHierarchy              = 1 << 3;   // IsWindowHovered() only: Do not consider popup hierarchy (do not treat popup emitter as parent of popup) (when used with _ChildWindows or _RootWindow)
    //ImGuiHoveredFlags_DockHierarchy               = 1 << 4,   // IsWindowHovered() only: Consider docking hierarchy (treat dockspace host as parent of docked window) (when used with _ChildWindows or _RootWindow)
    var ImGuiHoveredFlags_AllowWhenBlockedByPopup       = 1 << 5;   // Return true even if a popup window is normally blocking access to this item/window
    //ImGuiHoveredFlags_AllowWhenBlockedByModal     = 1 << 6,   // Return true even if a modal popup window is normally blocking access to this item/window. FIXME-TODO: Unavailable yet.
    var ImGuiHoveredFlags_AllowWhenBlockedByActiveItem  = 1 << 7;   // Return true even if an active item is blocking access to this item/window. Useful for Drag and Drop patterns.
    var ImGuiHoveredFlags_AllowWhenOverlapped           = 1 << 8;   // Return true even if the position is obstructed or overlapped by another window
    var ImGuiHoveredFlags_AllowWhenDisabled             = 1 << 9;   // Return true even if the item is disabled
    var ImGuiHoveredFlags_RectOnly                      = ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped;
    var ImGuiHoveredFlags_RootAndChildWindows           = ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows;
}

enum abstract ImGuiDragDropFlags(Int) from Int to Int
{
    var ImGuiDragDropFlags_None                         = 0;
    // BeginDragDropSource() flags
    var ImGuiDragDropFlags_SourceNoPreviewTooltip       = 1 << 0;   // By default, a successful call to BeginDragDropSource opens a tooltip so you can display a preview or description of the source contents. This flag disable this behavior.
    var ImGuiDragDropFlags_SourceNoDisableHover         = 1 << 1;   // By default, when dragging we clear data so that IsItemHovered() will return false, to avoid subsequent user code submitting tooltips. This flag disable this behavior so you can still call IsItemHovered() on the source item.
    var ImGuiDragDropFlags_SourceNoHoldToOpenOthers     = 1 << 2;   // Disable the behavior that allows to open tree nodes and collapsing header by holding over them while dragging a source item.
    var ImGuiDragDropFlags_SourceAllowNullID            = 1 << 3;   // Allow items such as Text(), Image() that have no unique identifier to be used as drag source, by manufacturing a temporary identifier based on their window-relative position. This is extremely unusual within the dear imgui ecosystem and so we made it explicit.
    var ImGuiDragDropFlags_SourceExtern                 = 1 << 4;   // External source (from outside of dear imgui), won't attempt to read current item/window info. Will always return true. Only one Extern source can be active simultaneously.
    var ImGuiDragDropFlags_SourceAutoExpirePayload      = 1 << 5;   // Automatically expire the payload if the source cease to be submitted (otherwise payloads are persisting while being dragged)
    // AcceptDragDropPayload() flags
    var ImGuiDragDropFlags_AcceptBeforeDelivery         = 1 << 10;  // AcceptDragDropPayload() will returns true even before the mouse button is released. You can then call IsDelivery() to test if the payload needs to be delivered.
    var ImGuiDragDropFlags_AcceptNoDrawDefaultRect      = 1 << 11;  // Do not draw the default highlight rectangle when hovering over target.
    var ImGuiDragDropFlags_AcceptNoPreviewTooltip       = 1 << 12;  // Request hiding the BeginDragDropSource tooltip from the BeginDragDropTarget site.
    var ImGuiDragDropFlags_AcceptPeekOnly               = ImGuiDragDropFlags_AcceptBeforeDelivery | ImGuiDragDropFlags_AcceptNoDrawDefaultRect;  // For peeking ahead and inspecting the payload before delivery.
}

enum abstract ImGuiDir(Int) from Int to Int
{
    var ImGuiDir_None    = -1;
    var ImGuiDir_Left    = 0;
    var ImGuiDir_Right   = 1;
    var ImGuiDir_Up      = 2;
    var ImGuiDir_Down    = 3;
}

enum abstract ImGuiSortDirection(Int) from Int to Int
{
    var ImGuiSortDirection_None         = 0;
    var ImGuiSortDirection_Ascending    = 1;    // Ascending = 0->9, A->Z etc.
    var ImGuiSortDirection_Descending   = 2;    // Descending = 9->0, Z->A etc.
}

enum abstract ImGuiButtonFlags(Int) from Int to Int
{
    var ImGuiButtonFlags_None                   = 0;
    var ImGuiButtonFlags_MouseButtonLeft        = 1 << 0;   // React on left mouse button (default)
    var ImGuiButtonFlags_MouseButtonRight       = 1 << 1;   // React on right mouse button
    var ImGuiButtonFlags_MouseButtonMiddle      = 1 << 2;   // React on center mouse button
}

enum abstract ImGuiColorEditFlags(Int) from Int to Int
{
    var ImGuiColorEditFlags_None            = 0;
    var ImGuiColorEditFlags_NoAlpha         = 1 << 1;   //              // ColorEdit, ColorPicker, ColorButton: ignore Alpha component (will only read 3 components from the input pointer).
    var ImGuiColorEditFlags_NoPicker        = 1 << 2;   //              // ColorEdit: disable picker when clicking on color square.
    var ImGuiColorEditFlags_NoOptions       = 1 << 3;   //              // ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.
    var ImGuiColorEditFlags_NoSmallPreview  = 1 << 4;   //              // ColorEdit, ColorPicker: disable color square preview next to the inputs. (e.g. to show only the inputs)
    var ImGuiColorEditFlags_NoInputs        = 1 << 5;   //              // ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview color square).
    var ImGuiColorEditFlags_NoTooltip       = 1 << 6;   //              // ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the preview.
    var ImGuiColorEditFlags_NoLabel         = 1 << 7;   //              // ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).
    var ImGuiColorEditFlags_NoSidePreview   = 1 << 8;   //              // ColorPicker: disable bigger color preview on right side of the picker, use small color square preview instead.
    var ImGuiColorEditFlags_NoDragDrop      = 1 << 9;   //              // ColorEdit: disable drag and drop target. ColorButton: disable drag and drop source.
    var ImGuiColorEditFlags_NoBorder        = 1 << 10;  //              // ColorButton: disable border (which is enforced by default)

    // User Options (right-click on widget to change some of them).
    var ImGuiColorEditFlags_AlphaBar        = 1 << 16;  //              // ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
    var ImGuiColorEditFlags_AlphaPreview    = 1 << 17;  //              // ColorEdit, ColorPicker, ColorButton: display preview as a transparent color over a checkerboard, instead of opaque.
    var ImGuiColorEditFlags_AlphaPreviewHalf= 1 << 18;  //              // ColorEdit, ColorPicker, ColorButton: display half opaque / half checkerboard, instead of opaque.
    var ImGuiColorEditFlags_HDR             = 1 << 19;  //              // (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use ImGuiColorEditFlags_Float flag as well).
    var ImGuiColorEditFlags_DisplayRGB      = 1 << 20;  // [Display]    // ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    var ImGuiColorEditFlags_DisplayHSV      = 1 << 21;  // [Display]    // "
    var ImGuiColorEditFlags_DisplayHex      = 1 << 22;  // [Display]    // "
    var ImGuiColorEditFlags_Uint8           = 1 << 23;  // [DataType]   // ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255.
    var ImGuiColorEditFlags_Float           = 1 << 24;  // [DataType]   // ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.
    var ImGuiColorEditFlags_PickerHueBar    = 1 << 25;  // [Picker]     // ColorPicker: bar for Hue, rectangle for Sat/Value.
    var ImGuiColorEditFlags_PickerHueWheel  = 1 << 26;  // [Picker]     // ColorPicker: wheel for Hue, triangle for Sat/Value.
    var ImGuiColorEditFlags_InputRGB        = 1 << 27;  // [Input]      // ColorEdit, ColorPicker: input and output data in RGB format.
    var ImGuiColorEditFlags_InputHSV        = 1 << 28;  // [Input]      // ColorEdit, ColorPicker: input and output data in HSV format.

    // Defaults Options. You can set application defaults using SetColorEditOptions(). The intent is that you probably don't want to
    // override them in most of your calls. Let the user choose via the option menu and/or call SetColorEditOptions() once during startup.
    var ImGuiColorEditFlags_DefaultOptions_ = ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_PickerHueBar;
}

enum abstract ImGuiSliderFlags(Int) from Int to Int
{
    var ImGuiSliderFlags_None                   = 0;
    var ImGuiSliderFlags_AlwaysClamp            = 1 << 4;       // Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.
    var ImGuiSliderFlags_Logarithmic            = 1 << 5;       // Make the widget logarithmic (linear otherwise). Consider using ImGuiSliderFlags_NoRoundToFormat with this if using a format-string with small amount of digits.
    var ImGuiSliderFlags_NoRoundToFormat        = 1 << 6;       // Disable rounding underlying value to match precision of the display formatString (e.g. %.3f values are rounded to those 3 digits)
    var ImGuiSliderFlags_NoInput                = 1 << 7;       // Disable CTRL+Click or Enter key allowing to input text directly into the widget
}

enum abstract ImGuiCond(Int) from Int to Int
{
    var ImGuiCond_None          = 0;        // No condition (always set the variable), same as _Always
    var ImGuiCond_Always        = 1 << 0;   // No condition (always set the variable)
    var ImGuiCond_Once          = 1 << 1;   // Set the variable once per runtime session (only the first call will succeed)
    var ImGuiCond_FirstUseEver  = 1 << 2;   // Set the variable if the object/window has no persistently saved data (no entry in .ini file)
    var ImGuiCond_Appearing     = 1 << 3;   // Set the variable if the object/window is appearing after being hidden/inactive (or the first time)
}

enum abstract ImDrawCornerFlags(Int) from Int to Int
{
    var ImDrawCornerFlags_None          = 0;
    var ImDrawCornerFlags_TopLeft       = 1;
    var ImDrawCornerFlags_TopRight      = 2;
    var ImDrawCornerFlags_BotLeft       = 4;
    var ImDrawCornerFlags_BotRight      = 8;
    var ImDrawCornerFlags_Top           = 3;
    var ImDrawCornerFlags_Bot           = 12;
    var ImDrawCornerFlags_Left          = 5;
    var ImDrawCornerFlags_Right         = 10;
    var ImDrawCornerFlags_All           = 15;
}

enum abstract ImDrawListFlags(Int) from Int to Int
{
    var ImDrawListFlags_None                    = 0;
    var ImDrawListFlags_AntiAliasedLines        = 1;
    var ImDrawListFlags_AntiAliasedLinesUseTex  = 2;
    var ImDrawListFlags_AntiAliasedFill         = 4;
    var ImDrawListFlags_AllowVtxOffset          = 8;
}

enum abstract ImFontAtlasFlags(Int) from Int to Int
{
    var ImFontAtlasFlags_None                   = 0;
    var ImFontAtlasFlags_NoPowerOfTwoHeight     = 1;
    var ImFontAtlasFlags_NoMouseCursors         = 2;
    var ImFontAtlasFlags_NoBakedLines           = 4;
}

enum abstract ImGuiKey(Int) from Int to Int
{
    var ImGuiKey_Tab                = 0;
    var ImGuiKey_LeftArrow          = 1;
    var ImGuiKey_RightArrow         = 2;
    var ImGuiKey_UpArrow            = 3;
    var ImGuiKey_DownArrow          = 4;
    var ImGuiKey_PageUp             = 5;
    var ImGuiKey_PageDown           = 6;
    var ImGuiKey_Home               = 7;
    var ImGuiKey_End                = 8;
    var ImGuiKey_Insert             = 9;
    var ImGuiKey_Delete             = 10;
    var ImGuiKey_Backspace          = 11;
    var ImGuiKey_Space              = 12;
    var ImGuiKey_Enter              = 13;
    var ImGuiKey_Escape             = 14;
    var ImGuiKey_KeyPadEnter        = 15;
    var ImGuiKey_A                  = 16;                 // for text edit CTRL+A: select all
    var ImGuiKey_C                  = 17;                 // for text edit CTRL+C: copy
    var ImGuiKey_V                  = 18;                 // for text edit CTRL+V: paste
    var ImGuiKey_X                  = 19;                 // for text edit CTRL+X: cut
    var ImGuiKey_Y                  = 20;                 // for text edit CTRL+Y: redo
    var ImGuiKey_Z                  = 21;                 // for text edit CTRL+Z: undo
    var ImGuiKey_COUNT              = 22;
}

enum abstract ImGuiCol(Int) from Int to Int
{
    var ImGuiCol_Text                   = 0;
    var ImGuiCol_TextDisabled           = 1;
    var ImGuiCol_WindowBg               = 2; // Background of normal windows
    var ImGuiCol_ChildBg                = 3; // Background of child windows
    var ImGuiCol_PopupBg                = 4; // Background of popups, menus, tooltips windows
    var ImGuiCol_Border                 = 5;
    var ImGuiCol_BorderShadow           = 6;
    var ImGuiCol_FrameBg                = 7;// Background of checkbox, radio button, plot, slider, text input
    var ImGuiCol_FrameBgHovered         = 8;
    var ImGuiCol_FrameBgActive          = 9;
    var ImGuiCol_TitleBg                = 10;
    var ImGuiCol_TitleBgActive          = 11;
    var ImGuiCol_TitleBgCollapsed       = 12;
    var ImGuiCol_MenuBarBg              = 13;
    var ImGuiCol_ScrollbarBg            = 14;
    var ImGuiCol_ScrollbarGrab          = 15;
    var ImGuiCol_ScrollbarGrabHovered   = 16;
    var ImGuiCol_ScrollbarGrabActive    = 17;
    var ImGuiCol_CheckMark              = 18;
    var ImGuiCol_SliderGrab             = 19;
    var ImGuiCol_SliderGrabActive       = 20;
    var ImGuiCol_Button                 = 21;
    var ImGuiCol_ButtonHovered          = 22;
    var ImGuiCol_ButtonActive           = 23;
    var ImGuiCol_Header                 = 24;                // Header* colors are used for CollapsingHeader, TreeNode, Selectable, MenuItem
    var ImGuiCol_HeaderHovered          = 25;
    var ImGuiCol_HeaderActive           = 26;
    var ImGuiCol_Separator              = 27;
    var ImGuiCol_SeparatorHovered       = 28;
    var ImGuiCol_SeparatorActive        = 29;
    var ImGuiCol_ResizeGrip             = 30;
    var ImGuiCol_ResizeGripHovered      = 31;
    var ImGuiCol_ResizeGripActive       = 32;
    var ImGuiCol_Tab                    = 33;
    var ImGuiCol_TabHovered             = 34;
    var ImGuiCol_TabActive              = 35;
    var ImGuiCol_TabUnfocused           = 36;
    var ImGuiCol_TabUnfocusedActive     = 37;
    var ImGuiCol_PlotLines              = 38;
    var ImGuiCol_PlotLinesHovered       = 39;
    var ImGuiCol_PlotHistogram          = 40;
    var ImGuiCol_PlotHistogramHovered   = 41;
    var ImGuiCol_TableHeaderBg          = 42;         // Table header background
    var ImGuiCol_TableBorderStrong      = 43;     // Table outer and header borders (prefer using Alpha=1.0 here)
    var ImGuiCol_TableBorderLight       = 44;      // Table inner borders (prefer using Alpha=1.0 here)
    var ImGuiCol_TableRowBg             = 45;            // Table row background (even rows)
    var ImGuiCol_TableRowBgAlt          = 46;         // Table row background (odd rows)
    var ImGuiCol_TextSelectedBg         = 47;
    var ImGuiCol_DragDropTarget         = 48;
    var ImGuiCol_NavHighlight           = 49;          // Gamepad/keyboard: current highlighted item
    var ImGuiCol_NavWindowingHighlight  = 50; // Highlight window when using CTRL+TAB
    var ImGuiCol_NavWindowingDimBg      = 51;     // Darken/colorize entire screen behind the CTRL+TAB window list, when active
    var ImGuiCol_ModalWindowDimBg       = 52;      // Darken/colorize entire screen behind a modal window, when one is active
    var ImGuiCol_COUNT                  = 53;
}

enum abstract ImGuiSelectableFlags(Int) from Int to Int
{
    var ImGuiSelectableFlags_None               = 0;
    var ImGuiSelectableFlags_DontClosePopups    = 1 << 0;   // Clicking this don't close parent popup window
    var ImGuiSelectableFlags_SpanAllColumns     = 1 << 1;   // Selectable frame can span all columns (text will still fit in current column)
    var ImGuiSelectableFlags_AllowDoubleClick   = 1 << 2;   // Generate press events on double clicks too
    var ImGuiSelectableFlags_Disabled           = 1 << 3;   // Cannot be selected, display grayed out text
    var ImGuiSelectableFlags_AllowItemOverlap   = 1 << 4;   // (WIP) Hit testing to allow subsequent widgets to overlap this one
}

enum abstract ImGuiMouseButton(Int) from Int to Int
{
    var ImGuiMouseButton_Left = 0;
    var ImGuiMouseButton_Right = 1;
    var ImGuiMouseButton_Middle = 2;
    var ImGuiMouseButton_COUNT = 5;
}

enum abstract ImGuiMouseCursor(Int) from Int to Int
{
    var ImGuiMouseCursor_None = -1;
    var ImGuiMouseCursor_Arrow = 0;
    var ImGuiMouseCursor_TextInput = 1;         // When hovering over InputText, etc.
    var ImGuiMouseCursor_ResizeAll = 2;         // (Unused by Dear ImGui functions)
    var ImGuiMouseCursor_ResizeNS = 3;          // When hovering over an horizontal border
    var ImGuiMouseCursor_ResizeEW = 4;          // When hovering over a vertical border or a column
    var ImGuiMouseCursor_ResizeNESW = 5;        // When hovering over the bottom-left corner of a window
    var ImGuiMouseCursor_ResizeNWSE = 6;        // When hovering over the bottom-right corner of a window
    var ImGuiMouseCursor_Hand = 7;              // (Unused by Dear ImGui functions. Use for e.g. hyperlinks)
    var ImGuiMouseCursor_NotAllowed = 8;        // When hovering something with disallowed interaction. Usually a crossed circle.
    var ImGuiMouseCursor_COUNT = 9;
}

@:native("ImVec2")
extern class ImVec2
{
    public function new(x:Float, y:Float);
    public var x:Float;
    public var y:Float;
}

@:native("ImVec4")
extern class ImVec4
{
    public function new(?x:Float, ?y:Float, ?z:Float, ?w:Float);
    public var x:Float;
    public var y:Float;
    public var z:Float;
    public var w:Float;
}

@:native("ImColor")
extern class ImColor
{
    @:overload(function(col:ImVec4):ImColor {})
    @:overload(function(rgba:UInt):ImColor {})
    @:overload(function(r:Float, g:Float, b:Float, a:Float):ImColor {})
    public function new(r:Float, g:Float, b:Float);

    public var Value:ImVec4;
    public function toImU32():UInt;
    public function toImVec4():ImVec4;
    public function SetHSV(h:Float, s:Float, v:Float, ?a:Float):Void;

}

typedef ComboValueGetter<T> = (T, Int, String) -> Bool;
typedef ImGuiInputTextCallback<T> = (ImGuiInputTextCallbackData<T>) -> Int;
typedef ListBoxItemGetter<T> = (T, Int, String) -> Bool;
typedef PlotLinesValueGetter<T> = (T, Int) -> Int;
typedef PlotHistogramValueGetter<T> = (T, Int) -> Int;

@:native("ImGui")
extern class ImGui
{
    public static function CreateContext(?shared_font_atlas:ImFontAtlas):ImGuiContext;
    public static function DestroyContext(?ctx:ImGuiContext):Void;
    public static function GetCurrentContext():ImGuiContext;
    public static function SetCurrentContext(ctx:ImGuiContext):Void;
    public static function GetIO():ImGuiIO;
    public static function GetStyle():ImGuiStyle;
    public static function NewFrame():Void;
    public static function EndFrame():Void;
    public static function Render():Void;
    public static function GetDrawData():ImDrawData;
    public static function ShowDemoWindow(?p_open:(Bool) -> Bool):Void;
    public static function ShowMetricsWindow(?p_open:(Bool) -> Bool):Void;
    public static function ShowAboutWindow(?p_open:(Bool) -> Bool):Void;
    public static function ShowStyleEditor(?ref:ImGuiStyle):Void;
    public static function ShowStyleSelector(label:String):Bool;
    public static function ShowFontSelector(label:String):Void;
    public static function ShowUserGuide():Void;
    public static function GetVersion():String;
    public static function StyleColorsDark(?dst:ImGuiStyle):Void;
    public static function StyleColorsLight(?dst:ImGuiStyle):Void;
    public static function StyleColorsClassic(?dst:ImGuiStyle):Void;
    public static function Begin(name:String, ?open:(Bool) -> Bool, ?flags:ImGuiWindowFlags):Bool;
    public static function End():Void;
    public static function BeginChild(id:EitherType<String, Int>, ?size:ImVec2, ?border:Bool, ?flags:ImGuiWindowFlags):Bool;
    public static function EndChild():Void;
    public static function IsWindowAppearing():Bool;
    public static function IsWindowCollapsed():Bool;
    public static function IsWindowFocused(?flags:ImGuiFocusedFlags):Bool;
    public static function IsWindowHovered(?flags:ImGuiHoveredFlags):Bool;
    public static function GetWindowDrawList():ImDrawList;
    public static function GetWindowPos(?out:ImVec2):ImVec2;
    public static function GetWindowSize(?out:ImVec2):ImVec2;
    public static function GetWindowWidth():Int;
    public static function GetWindowHeight():Int;
    public static function SetNextWindowPos(pos:ImVec2, ?cond:ImGuiCond, ?pivot:ImVec2):Void;
    public static function SetNextWindowSize(pos:ImVec2, ?cond:ImGuiCond):Void;
    public static function SetNextWindowSizeConstraints(size_min:ImVec2, size_max:ImVec2):Void;
    //public static function SetNextWindowSizeConstraints<T>(size_min:ImVec2, size_max:ImVec2, custom_callback: ImGuiSizeCallback<T>, custom_callback_data?: T):Void;
    public static function SetNextWindowContentSize(size:ImVec2):Void;
    public static function SetNextWindowCollapsed(collapsed:Bool, ?cond:ImGuiCond):Void;
    public static function SetNextWindowFocus():Void;
    public static function SetNextWindowBgAlpha(alpha:Float):Void;
    public static function SetWindowPos(name_or_pos:EitherType<String, ImVec2>, ?pos_or_cond:EitherType<ImVec2, ImGuiCond>, ?cond:ImGuiCond):Void;
    public static function SetWindowSize(name_or_size:EitherType<String, ImVec2>, ?size_or_cond:EitherType<ImVec2, ImGuiCond>, ?cond:ImGuiCond):Void;
    public static function SetWindowCollapsed(name_or_collapsed:EitherType<String, Bool>, ?collapsed_or_cond:EitherType<Bool, ImGuiCond>, ?cond:ImGuiCond):Void;
    public static function SetWindowFocus(?name:String):Void;
    public static function SetWindowFontScale(scale:Float):Void;
    public static function GetContentRegionAvail(?out:ImVec2):ImVec2;
    public static function GetContentRegionMax(?out:ImVec2):ImVec2;
    public static function GetWindowContentRegionMin(?out: ImVec2):ImVec2;
    public static function GetWindowContentRegionMax(?out: ImVec2):ImVec2;
    public static function GetWindowContentRegionWidth():Float;
    public static function GetScrollX():Float;
    public static function GetScrollY():Float;
    public static function SetScrollX(scroll_x:Float):Void;
    public static function SetScrollY(scroll_y:Float):Void;
    public static function GetScrollMaxX():Float;
    public static function GetScrollMaxY():Float;
    public static function SetScrollHereX(?center_x_ratio:Float):Void;
    public static function SetScrollHereY(?center_y_ratio:Float):Void;
    public static function SetScrollFromPosX(pos_x:Float, ?center_x_ratio:Float):Void;
    public static function SetScrollFromPosY(pos_y:Float, ?center_y_ratio:Float):Void;
    public static function PushFont(font:Null<ImFont>):Void;
    public static function PopFont():Void;
    public static function PushStyleColor(idx:ImGuiCol, col:EitherType<UInt, EitherType<ImVec4, ImColor>>):Void;
    public static function PopStyleColor(?count:Int):Void;
    //public static function PushStyleVar(idx:ImGuiStyleVar, val: number | Readonly<Bind.interface_ImVec2>):Void;
    //public static function PopStyleVar(count?: number):Void;
    public static function PushAllowKeyboardFocus(allow_keyboard_focus:Bool):Void;
    public static function PopAllowKeyboardFocus():Void;
    public static function PushButtonRepeat(repeat:Bool):Void;
    public static function PopButtonRepeat():Void;
    public static function PushItemWidth(item_width:Float):Void;
    public static function PopItemWidth():Void;
    public static function SetNextItemWidth(item_width:Float):Void;
    public static function CalcItemWidth():Float;
    public static function PushTextWrapPos(?wrap_pos_x:Float):Void;
    public static function PopTextWrapPos():Void;
    public static function GetFont():ImFont;
    public static function GetFontSize():Float;
    public static function GetFontTexUvWhitePixel(?out:ImVec2):ImVec2;
    @:overload(function(idx:ImGuiCol, ?alpha_mul:Float):UInt {})
    @:overload(function(col:ImVec4):UInt {})
    public static function GetColorU32(col:UInt):UInt;
    public static function GetStyleColorVec4(idx:ImGuiCol):ImVec4;
    public static function Separator():Void;
    public static function SameLine(?pos_x:Float, ?spacing_w:Float):Void;
    public static function NewLine():Void;
    public static function Spacing():Void;
    public static function Dummy(size:ImVec2):Void;
    public static function Indent(?indent_w:Float):Void;
    public static function Unindent(?indent_w:Float):Void;
    public static function BeginGroup():Void;
    public static function EndGroup():Void;
    public static function GetCursorPos(?out:ImVec2):ImVec2;
    public static function GetCursorPosX():Float;
    public static function GetCursorPosY():Float;
    public static function SetCursorPos(local_pos:ImVec2):Void;
    public static function SetCursorPosX(x:Float):Void;
    public static function SetCursorPosY(y:Float):Void;
    public static function GetCursorStartPos(?out:ImVec2):ImVec2;
    public static function GetCursorScreenPos(?out:ImVec2):ImVec2;
    public static function SetCursorScreenPos(pos:ImVec2):Void;
    public static function AlignTextToFramePadding():Void;
    public static function GetTextLineHeight():Float;
    public static function GetTextLineHeightWithSpacing():Float;
    public static function GetFrameHeight():Float;
    public static function GetFrameHeightWithSpacing():Float;
    public static function PushID(id:EitherType<String, Float>):Void;
    public static function PopID():Void;
    public static function GetID(id:EitherType<String, Float>):Int;
    public static function TextUnformatted(text:String, ?text_end:Null<Int>):Void;
    public static function Text(text:String):Void;
    public static function TextColored(col:EitherType<ImVec4, ImColor>, text:String):Void;
    public static function TextDisabled(text:String):Void;
    public static function TextWrapped(text:String):Void;
    public static function LabelText(label:String, text:String):Void;
    public static function BulletText(text:String):Void;
    public static function Button(label:String, ?size:ImVec2):Bool;
    public static function SmallButton(label:String):Bool;
    public static function ArrowButton(str_id:String, dir:ImGuiDir):Bool;
    public static function InvisibleButton(str_id:String, size:ImVec2, ?flags:ImGuiButtonFlags):Bool;
    public static function Image(user_texture_id:UInt, size:ImVec2, ?uv0:ImVec2, ?uv1:ImVec2, ?tint_col:ImVec4, ?border_col:ImVec4):Void;
    public static function ImageButton(user_texture_id:UInt, ?size:ImVec2, ?uv0:ImVec2, ?uv1:ImVec2, ?frame_padding:Float, ?bg_col:ImVec4, ?tint_col:ImVec4):Bool;
    public static function Checkbox(label:String, v:(Bool) -> Bool):Bool;
    public static function CheckboxFlags(label:String, flags:(Int) -> Int, flags_value:Int):Bool;
    @:overload(function(label:String, v:(Int) -> Int, v_button:Int):Int {})
    public static function RadioButton(label:String, active:Bool):Bool;
    public static function ProgressBar(fraction:Float, ?size_arg:ImVec2, ?overlay:String):Void;
    public static function Bullet():Void;
    public static function BeginCombo(label:String, ?preview_value:String, ?flags:ImGuiComboFlags):Bool;
    public static function EndCombo():Void;
    @:overload(function(label:String, current_item:(Int) -> Int, items:Array<String>, ?items_count:Int, ?popup_max_height_in_items:Float):Bool {})
    @:overload(function(label:String, current_item:(Int) -> Int, items_separated_by_zeros:String, ?popup_max_height_in_items:Float):Bool {})
    public static function Combo<T>(label:String, current_item:(Int) -> Int, items_getter:ComboValueGetter<T>, data:T, items_count:Int, ?popup_max_height_in_items:Float):Bool;
    public static function DragFloat(label:String, v:(Float) -> Float, ?v_speed:Float, ?v_min:Float, ?v_max:Float, ?display_format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragFloat2(label:String, v:(Array<Float>) -> Array<Float>, ?v_speed:Float, ?v_min:Float, ?v_max:Float, ?display_format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragFloat3(label:String, v:(Array<Float>) -> Array<Float>, ?v_speed:Float, ?v_min:Float, ?v_max:Float, ?display_format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragFloat4(label:String, v:(Array<Float>) -> Array<Float>, ?v_speed:Float, ?v_min:Float, ?v_max:Float, ?display_format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragFloatRange2(label:String, v_current_min:(Float) -> Float, v_current_max:(Float) -> Float, ?v_speed:Float, ?v_min:Float, ?v_max:Float, ?display_format:String, ?display_format_max:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragInt(label:String, v:(Int) -> Int, ?v_speed:Float, ?v_min:Int, ?v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragInt2(label:String, v:(Array<Int>) -> Array<Int>, ?v_speed:Float, ?v_min:Int, ?v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragInt3(label:String, v:(Array<Int>) -> Array<Int>, ?v_speed:Float, ?v_min:Int, ?v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragInt4(label:String, v:(Array<Int>) -> Array<Int>, ?v_speed:Float, ?v_min:Int, ?v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragIntRange2(label:String, v_current_min:(Int) -> Int, v_current_max:(Int) -> Int, ?v_speed:Float, ?v_min:Int, ?v_max:Int, ?format:String, ?format_max:String, ?flags:ImGuiSliderFlags):Bool;
    public static function DragScalar(label:String, v:(Array<Any>) -> Array<Any>, v_speed:Float, ?v_min:Any, ?v_max:Any, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderFloat(label:String, v:(Float) -> Float, v_min:Float, v_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderFloat2(label:String, v:(Array<Float>) -> Array<Float>, v_min:Float, v_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderFloat3(label:String, v:(Array<Float>) -> Array<Float>, v_min:Float, v_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderFloat4(label:String, v:(Array<Float>) -> Array<Float>, v_min:Float, v_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderAngle(label:String, v_rad:(Float) -> Float, ?v_degrees_min:Float, ?v_degrees_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderAngle3(label:String, v_rad:(Array<Float>) -> Float, ?v_degrees_min:Float, ?v_degrees_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderInt(label:String, v:(Int) -> Int, v_min:Int, v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderInt2(label:String, v:(Array<Int>) -> Array<Int>, v_min:Int, v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderInt3(label:String, v:(Array<Int>) -> Array<Int>, v_min:Int, v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderInt4(label:String, v:(Array<Int>) -> Array<Int>, v_min:Int, v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function SliderScalar(label:String, v:(Array<Any>) -> Array<Any>, v_min:Any, v_max:Any, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function VSliderFloat(label:String, size:ImVec2, v:(Float) -> Float, v_min:Float, v_max:Float, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    public static function VSliderInt(label:String, size:ImVec2, v:(Int) -> Int, v_min:Int, v_max:Int, ?format:String, ?flags:ImGuiSliderFlags):Bool;
    //public static function VSliderScalar(label:String, size:ImVec2, data_type: ImGuiDataType, v: Bind.ImAccess<number> | Bind.ImScalar<number>, v_min: number, v_max: number, format?:String | null, flags?: ImGuiSliderFlags):Bool;
    public static function InputText<T>(label:String, buf:(String) -> String, ?buf_size:Int, ?flags:ImGuiInputTextFlags, ?callback:ImGuiInputTextCallback<T>, ?user_data:T):Bool;
    public static function InputTextMultiline<T>(label:String, buf:(String) -> String, ?buf_size:Int, ?size:ImVec2, ?flags:ImGuiInputTextFlags, ?callback:ImGuiInputTextCallback<T>, ?user_data:T):Bool;
    public static function InputTextWithHint<T>(label:String, hint:String, buf:(String) -> String, ?buf_size:Int, ?flags:ImGuiInputTextFlags, ?callback:ImGuiInputTextCallback<T>, ?user_data:T):Bool;
    public static function InputFloat(label:String, v:(Float) -> Float, ?step:Float, ?step_fast:Float, ?format:String, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputFloat2(label:String, v:(Array<Float>) -> Array<Float>, ?format:String, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputFloat3(label:String, v:(Array<Float>) -> Array<Float>, ?format:String, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputFloat4(label:String, v:(Array<Float>) -> Array<Float>, ?format:String, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputInt(label:String, v:(Int) -> Int, ?step:Int, ?step_fast:Int, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputInt2(label:String, v:(Array<Int>) -> Array<Int>, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputInt3(label:String, v:(Array<Int>) -> Array<Int>, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputInt4(label:String, v:(Array<Int>) -> Array<Int>, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputDouble(label:String, v:(Float) -> Float, ?step:Float, ?step_fast:Float, ?format:String, ?flags:ImGuiInputTextFlags):Bool;
    public static function InputScalar(label:String, v:(Array<Any>) -> Array<Any>, ?step:Any, ?step_fast:Any, ?format:String, ?flags:ImGuiInputTextFlags):Bool;
    public static function ColorEdit3(label:String, col:(ImVec4) -> ImVec4, ?flags:ImGuiColorEditFlags):Bool;
    public static function ColorEdit4(label:String, col:(ImVec4) -> ImVec4, ?flags:ImGuiColorEditFlags):Bool;
    public static function ColorPicker3(label:String, col:(ImVec4) -> ImVec4, ?flags:ImGuiColorEditFlags):Bool;
    public static function ColorPicker4(label:String, col:(ImVec4) -> ImVec4, ?flags:ImGuiColorEditFlags, ?ref_col:(ImVec4) -> ImVec4):Bool;
    public static function ColorButton(desc_id:String, col:(ImVec4) -> ImVec4, ?flags:ImGuiColorEditFlags, ?size:ImVec2):Bool;
    public static function SetColorEditOptions(flags:ImGuiColorEditFlags):Void;
    
    @:overload(function(label:Int, fmt:String):Bool {})
    @:overload(function(label:String, fmt:String):Bool {})
    public static function TreeNode(label:String):Bool;
    
    @:overload(function(ptr_id:Int, flags:ImGuiTreeNodeFlags, fmt:String):Bool {})
    @:overload(function(str_id:String, flags:ImGuiTreeNodeFlags, fmt:String):Bool {})
    public static function TreeNodeEx(label:String, ?flags: ImGuiTreeNodeFlags):Bool;
    
    @:overload(function(ptr_id:Int):Void {})
    public static function TreePush(str_id:String):Void;

    public static function TreePop():Void;
    public static function GetTreeNodeToLabelSpacing():Float;
    @:overload(function(label:String, p_open:(Bool) -> Bool, ?flags:ImGuiTreeNodeFlags):Bool {})
    public static function CollapsingHeader(label:String, ?flags: ImGuiTreeNodeFlags):Bool;
    public static function SetNextItemOpen(is_open:Bool, ?cond:ImGuiCond):Void;
    @:overload(function(label:String, ?p_selected:(Bool) -> Bool, ?flags:ImGuiSelectableFlags, ?size:ImVec2):Bool {})
    public static function Selectable(label:String, ?selected:Bool, ?flags:ImGuiSelectableFlags, ?size:ImVec2):Bool;
    @:overload(function(label:String, current_item:(Int) -> Int, items:Array<String>, ?items_count:Int, ?height_in_items:Float):Bool {})
    public static function ListBox<T>(label:String, current_item:(Int) -> Int, items_getter:ListBoxItemGetter<T>, data:T, items_count:Int, ?height_in_items:Float):Bool;
    @:overload(function(label:String, items_count:Int, ?height_in_items:Float):Bool {})
    public static function ListBoxHeader(label:String, size:ImVec2):Bool;
    public static function ListBoxFooter():Void;    
    @:overload(function(label:String, values:Array<Int>, ?values_count:Int, ?value_offset:Int, ?overlay_text:String, ?scale_min:Float, ?scale_max:Float, ?graph_size:ImVec2, ?stride:Int):Void {})
    public static function PlotLines<T>(label:String, values_getter:PlotLinesValueGetter<T>, data:T, ?values_count:Int, ?value_offset:Int, ?overlay_text:String, ?scale_min:Float, ?scale_max:Float, ?graph_size:ImVec2):Void;
    @:overload(function(label:String, values:Array<Float>, ?values_count:Int, ?value_offset:Float, ?overlay_text:String, ?scale_min:Float, ?scale_max:Float, ?graph_size:ImVec2, ?stride:Int):Void {})
    public static function PlotHistogram<T>(label:String, values_getter:PlotHistogramValueGetter<T>, data:T, ?values_count:Int, ?value_offset:Float, ?overlay_text:String, ?scale_min:Float, ?scale_max:Float, ?graph_size:ImVec2):Void;
    @:overload(function(prefix:String, b:Bool):Void {})
    @:overload(function(prefix:String, v:Float):Void {})
    @:overload(function(prefix:String, v:Float, ?float_format:String):Void {})
    public static function Value(prefix:String, v:Any):Void;
    public static function BeginMenuBar():Bool;
    public static function EndMenuBar():Void;
    public static function BeginMainMenuBar():Bool;
    public static function EndMainMenuBar():Void;
    public static function BeginMenu(label:String, ?enabled:Bool):Bool;
    public static function EndMenu():Void;

    @:overload(function(label:String, shortcut:String, p_selected:(Bool) -> Bool, ?enabled:Bool):Bool {})
    public static function MenuItem(label:String, ?shortcut:String, ?selected:Bool, ?enabled:Bool):Bool;

    public static function BeginTooltip():Void;
    public static function EndTooltip():Void;
    public static function SetTooltip(fmt:String):Void;
    public static function BeginPopup(str_id:String, ?flags:ImGuiWindowFlags):Bool;
    public static function BeginPopupModal(str_id:String, ?p_open:(Bool) -> Bool, ?flags:ImGuiWindowFlags):Bool;
    public static function EndPopup():Void;
    public static function OpenPopup(str_id:String, ?popup_flags:ImGuiPopupFlags):Void;
    public static function OpenPopupOnItemClick(?str_id:String, ?popup_flags:ImGuiPopupFlags):Void;
    public static function CloseCurrentPopup():Void;
    public static function BeginPopupContextItem(?str_id:String, ?popup_flags:ImGuiPopupFlags):Bool;
    public static function BeginPopupContextWindow(?str_id:String, ?popup_flags:ImGuiPopupFlags):Bool;
    public static function BeginPopupContextVoid(?str_id:String, ?popup_flags: ImGuiPopupFlags):Bool;
    public static function IsPopupOpen(str_id:String, ?flags:ImGuiPopupFlags):Bool;
    public static function BeginTable(str_id:String, column:Int, ?flags:ImGuiTableFlags, ?outer_size:ImVec2, ?inner_width:Float):Bool;
    public static function EndTable():Void;
    public static function TableNextRow(?row_flags:ImGuiTableRowFlags, ?min_row_height:Float):Void;
    public static function TableNextColumn():Bool;
    public static function TableSetColumnIndex(column_n:Int):Bool;
    public static function TableSetupColumn(label:String, ?flags:ImGuiTableColumnFlags, ?init_width_or_weight:Float, ?user_id:UInt):Void;
    public static function TableSetupScrollFreeze(cols:Int, rows:Int):Void;
    public static function TableHeadersRow():Void;
    public static function TableHeader(label:String):Void;
    public static function TableGetSortSpecs():ImGuiTableSortSpecs;
    public static function TableGetColumnCount():Int;
    public static function TableGetColumnIndex():Int;
    public static function TableGetRowIndex():Int;
    public static function TableGetColumnName(?column_n:Int):String;
    public static function TableGetColumnFlags(?column_n:Int): ImGuiTableColumnFlags;
    public static function TableSetBgColor(target:ImGuiTableBgTarget, color:UInt, ?column_n:Int):Void;
    public static function Columns(?count:Int, ?id:String, ?border:Bool):Void;
    public static function NextColumn():Void;
    public static function GetColumnIndex():Int;
    public static function GetColumnWidth(?column_index:Int):Float;
    public static function SetColumnWidth(column_index:Int, width:Float):Void;
    public static function GetColumnOffset(?column_index:Int):Float;
    public static function SetColumnOffset(column_index:Int, offset_x:Float):Void;
    public static function GetColumnsCount():Int;
    public static function BeginTabBar(str_id:String, ?flags:ImGuiTabBarFlags):Bool;
    public static function EndTabBar():Void;
    public static function BeginTabItem(label:String, ?p_open:(Bool) -> Bool, ?flags:ImGuiTabItemFlags):Bool;
    public static function EndTabItem():Void;
    public static function TabItemButton(label:String, ?flags:ImGuiTabItemFlags):Bool;
    public static function SetTabItemClosed(tab_or_docked_window_label:String):Void;
    public static function LogToTTY(?max_depth:Int):Void;
    public static function LogToFile(?max_depth:Int, ?filename:String):Void;
    public static function LogToClipboard(?max_depth:Int):Void;
    public static function LogFinish():Void;
    public static function LogButtons():Void;
    public static function LogText(fmt:String):Void;
    public static function BeginDragDropSource(?flags:ImGuiDragDropFlags):Bool;
    public static function SetDragDropPayload<T>(type:String, data:T, ?cond:ImGuiCond):Bool;
    public static function EndDragDropSource():Void;
    public static function BeginDragDropTarget():Bool;
    public static function AcceptDragDropPayload<T>(type:String, ?flags:ImGuiDragDropFlags):ImGuiPayload<T>;
    public static function EndDragDropTarget():Void;
    public static function GetDragDropPayload<T>():ImGuiPayload<T>;
    public static function PushClipRect(clip_rect_min:ImVec2, clip_rect_max:ImVec2, intersect_with_current_clip_rect:Bool):Void;
    public static function PopClipRect():Void;
    public static function SetItemDefaultFocus():Void;
    public static function SetKeyboardFocusHere(?offset:Float):Void;
    public static function IsItemHovered(?flags:ImGuiHoveredFlags):Bool;
    public static function IsItemActive():Bool;
    public static function IsItemFocused():Bool;
    public static function IsItemClicked(?mouse_button:ImGuiMouseButton):Bool;
    public static function IsItemVisible():Bool;
    public static function IsItemEdited():Bool;
    public static function IsItemActivated():Bool;
    public static function IsItemDeactivated():Bool;
    public static function IsItemDeactivatedAfterEdit():Bool;
    public static function IsItemToggledOpen():Bool;
    public static function IsAnyItemHovered():Bool;
    public static function IsAnyItemActive():Bool;
    public static function IsAnyItemFocused():Bool;
    public static function GetItemRectMin(?out:ImVec2):ImVec2;
    public static function GetItemRectMax(?out:ImVec2):ImVec2;
    public static function GetItemRectSize(?out:ImVec2):ImVec2;
    public static function SetItemAllowOverlap():Void;
    @:overload(function(rect_min:ImVec2, rect_max:ImVec2):Bool {})
    public static function IsRectVisible(size:ImVec2):Bool;
    public static function GetTime():Float;
    public static function GetFrameCount():Int;
    public static function GetBackgroundDrawList():ImDrawList;
    public static function GetForegroundDrawList():ImDrawList;
    public static function GetDrawListSharedData():ImDrawListSharedData;
    public static function GetStyleColorName(idx:ImGuiCol):String;
    public static function CalcListClipping(items_count:Int, items_height:Float, out_items_display_start:(Float) -> Float, out_items_display_end:(Float) -> Float):Void;
    public static function BeginChildFrame(id:EitherType<UInt, String>, size:ImVec2, ?flags:ImGuiWindowFlags):Bool;
    public static function EndChildFrame():Void;
    public static function CalcTextSize(text:String, ?text_end:Int, ?hide_text_after_double_hash:Bool, ?wrap_width:Float, ?out:ImVec2):ImVec2;
    public static function ColorConvertU32ToFloat4(in_:UInt, ?out:ImVec4):ImVec4;
    public static function ColorConvertFloat4ToU32(in_:ImVec4):UInt;
    public static function ColorConvertRGBtoHSV(r:Float, g:Float, b:Float, out_h:(Float) -> Float, out_s:(Float) -> Float, out_v:(Float) -> Float):Void;
    public static function ColorConvertHSVtoRGB(h:Float, s:Float, v:Float, out_r:(Float) -> Float, out_g:(Float) -> Float, out_b:(Float) -> Float):Void;
    public static function GetKeyIndex(imgui_key:ImGuiKey):Int;
    public static function IsKeyDown(user_key_index:Int):Bool;
    public static function IsKeyPressed(user_key_index:Int, ?repeat:Bool):Bool;
    public static function IsKeyReleased(user_key_index:Int):Bool;
    public static function GetKeyPressedAmount(user_key_index:Int, repeat_delay:Int, rate:Float):Int;
    public static function CaptureKeyboardFromApp(?capture:Bool):Void;
    public static function IsMouseDown(button:Int):Bool;
    public static function IsMouseClicked(button:Int, ?repeat:Bool):Bool;
    public static function IsMouseDoubleClicked(button:Int):Bool;
    public static function IsMouseReleased(button:Int):Bool;
    public static function IsMouseHoveringRect(r_min:ImVec2, r_max:ImVec2, ?clip:Bool):Bool;
    public static function IsMousePosValid(?mouse_pos:ImVec2):Bool;
    public static function IsAnyMouseDown():Bool;
    public static function GetMousePos(?out:ImVec2):ImVec2;
    public static function GetMousePosOnOpeningCurrentPopup(?out:ImVec2):ImVec2;
    public static function IsMouseDragging(?button:Int, ?lock_threshold:Int):Bool;
    public static function GetMouseDragDelta(?button:Int, ?lock_threshold:Int, ?out:ImVec2):ImVec2;
    public static function ResetMouseDragDelta(?button:Int):Void;
    public static function GetMouseCursor():ImGuiMouseCursor;
    public static function SetMouseCursor(type:ImGuiMouseCursor):Void;
    public static function CaptureMouseFromApp(?capture:Bool):Void;
    public static function GetClipboardText():String;
    public static function SetClipboardText(text:String):Void;
    public static function LoadIniSettingsFromDisk(ini_filename:String):Void;
    public static function LoadIniSettingsFromMemory(ini_data:String, ?ini_size:Int):Void;
    public static function SaveIniSettingsToDisk(ini_filename:String):Void;
    public static function SaveIniSettingsToMemory(?out_ini_size:(Int) -> Int):String;
    public static function DebugCheckVersionAndDataLayout(version_str:String, sz_io:Int, sz_style:Int, sz_vec2:Int, sz_vec4:Int, sz_draw_vert:Int, sz_draw_idx:Int):Bool;
    public static function SetAllocatorFunctions(alloc_func:(Int, Any) -> Int, free_func:(Int, Any) -> Void, ?user_data:Any):Void;
    public static function MemAlloc(sz:Int):Void;
    public static function MemFree(ptr:Any):Void;
}