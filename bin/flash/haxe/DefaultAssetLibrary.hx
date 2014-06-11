package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if (flash || js)
import openfl.display.Loader;
import openfl.events.Event;
import openfl.net.URLLoader;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		className.set ("img/slinky_small.jpg", __ASSET__img_slinky_small_jpg);
		type.set ("img/slinky_small.jpg", AssetType.IMAGE);
		className.set ("img/slinky_tiny.jpg", __ASSET__img_slinky_tiny_jpg);
		type.set ("img/slinky_tiny.jpg", AssetType.IMAGE);
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		className.set ("ui/demo.xml", __ASSET__ui_demo_xml);
		type.set ("ui/demo.xml", AssetType.TEXT);
		className.set ("ui/example.html", __ASSET__ui_example_html);
		type.set ("ui/example.html", AssetType.TEXT);
		className.set ("ui/test.html", __ASSET__ui_test_html);
		type.set ("ui/test.html", AssetType.TEXT);
		className.set ("img/haxe_ui.png", __ASSET__img_haxe_ui_png);
		type.set ("img/haxe_ui.png", AssetType.IMAGE);
		className.set ("img/icone_cocktail_blanche_ombre.png", __ASSET__img_icone_cocktail_blanche_ombre_png);
		type.set ("img/icone_cocktail_blanche_ombre.png", AssetType.IMAGE);
		className.set ("img/icone_haxe_blanche_ombre.png", __ASSET__img_icone_haxe_blanche_ombre_png);
		type.set ("img/icone_haxe_blanche_ombre.png", AssetType.IMAGE);
		className.set ("css/default/webview.css", __ASSET__css_default_webview_css);
		type.set ("css/default/webview.css", AssetType.TEXT);
		className.set ("css/gradient/webview.css", __ASSET__css_gradient_webview_css);
		type.set ("css/gradient/webview.css", AssetType.TEXT);
		className.set ("css/gradient/webview.min.css", __ASSET__css_gradient_webview_min_css);
		type.set ("css/gradient/webview.min.css", AssetType.TEXT);
		className.set ("css/webview.css", __ASSET__css_webview_css);
		type.set ("css/webview.css", AssetType.TEXT);
		className.set ("assets/css/default/webview.css", __ASSET__assets_css_default_webview_css);
		type.set ("assets/css/default/webview.css", AssetType.TEXT);
		className.set ("assets/css/gradient/webview.css", __ASSET__assets_css_gradient_webview_css);
		type.set ("assets/css/gradient/webview.css", AssetType.TEXT);
		className.set ("assets/css/gradient/webview.min.css", __ASSET__assets_css_gradient_webview_min_css);
		type.set ("assets/css/gradient/webview.min.css", AssetType.TEXT);
		className.set ("assets/css/webview.css", __ASSET__assets_css_webview_css);
		type.set ("assets/css/webview.css", AssetType.TEXT);
		className.set ("assets/img/haxe_ui.png", __ASSET__assets_img_haxe_ui_png);
		type.set ("assets/img/haxe_ui.png", AssetType.IMAGE);
		className.set ("assets/img/icone_cocktail_blanche_ombre.png", __ASSET__assets_img_icone_cocktail_blanche_ombre_png);
		type.set ("assets/img/icone_cocktail_blanche_ombre.png", AssetType.IMAGE);
		className.set ("assets/img/icone_haxe_blanche_ombre.png", __ASSET__assets_img_icone_haxe_blanche_ombre_png);
		type.set ("assets/img/icone_haxe_blanche_ombre.png", AssetType.IMAGE);
		className.set ("assets/openfl.svg", __ASSET__assets_openfl_svg);
		type.set ("assets/openfl.svg", AssetType.TEXT);
		className.set ("assets/ui/demo.xml", __ASSET__assets_ui_demo_xml);
		type.set ("assets/ui/demo.xml", AssetType.TEXT);
		className.set ("assets/ui/example.html", __ASSET__assets_ui_example_html);
		type.set ("assets/ui/example.html", AssetType.TEXT);
		className.set ("assets/ui/test.html", __ASSET__assets_ui_test_html);
		type.set ("assets/ui/test.html", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "styles/default/circle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/default/collapse.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/default/cross.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/default/expand.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/default/up_down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_dark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_dark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/circle_dark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gradient.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gripper_horizontal.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_horizontal_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical_disabled.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/accordion.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/accordion.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/button.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/buttons.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/buttons.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/calendar.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/checkbox.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/container.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/down_arrow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/left_arrow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/right_arrow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/up_arrow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_down.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hprogress.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hscroll.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/listview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/menus.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/optionbox.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popup.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popups.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/rtf.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/sliders.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/tab.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/tabs.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "styles/windows/textinput.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vprogress.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vscroll.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/windows.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "img/slinky_small.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/slinky_tiny.jpg";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "fonts/Oxygen-Bold.ttf";
		className.set (id, __ASSET__fonts_oxygen_bold_ttf);
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen.ttf";
		className.set (id, __ASSET__fonts_oxygen_ttf);
		type.set (id, AssetType.FONT);
		id = "ui/demo.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "ui/example.html";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "ui/test.html";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "img/haxe_ui.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/icone_cocktail_blanche_ombre.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "img/icone_haxe_blanche_ombre.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "css/default/webview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "css/gradient/webview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "css/gradient/webview.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "css/webview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/css/default/webview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/css/gradient/webview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/css/gradient/webview.min.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/css/webview.css";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/img/haxe_ui.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/img/icone_cocktail_blanche_ombre.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/img/icone_haxe_blanche_ombre.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/openfl.svg";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/ui/demo.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/ui/example.html";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/ui/test.html";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		
		className.set ("img/slinky_small.jpg", __ASSET__img_slinky_small_jpg);
		type.set ("img/slinky_small.jpg", AssetType.IMAGE);
		
		className.set ("img/slinky_tiny.jpg", __ASSET__img_slinky_tiny_jpg);
		type.set ("img/slinky_tiny.jpg", AssetType.IMAGE);
		
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		
		className.set ("ui/demo.xml", __ASSET__ui_demo_xml);
		type.set ("ui/demo.xml", AssetType.TEXT);
		
		className.set ("ui/example.html", __ASSET__ui_example_html);
		type.set ("ui/example.html", AssetType.TEXT);
		
		className.set ("ui/test.html", __ASSET__ui_test_html);
		type.set ("ui/test.html", AssetType.TEXT);
		
		className.set ("img/haxe_ui.png", __ASSET__img_haxe_ui_png);
		type.set ("img/haxe_ui.png", AssetType.IMAGE);
		
		className.set ("img/icone_cocktail_blanche_ombre.png", __ASSET__img_icone_cocktail_blanche_ombre_png);
		type.set ("img/icone_cocktail_blanche_ombre.png", AssetType.IMAGE);
		
		className.set ("img/icone_haxe_blanche_ombre.png", __ASSET__img_icone_haxe_blanche_ombre_png);
		type.set ("img/icone_haxe_blanche_ombre.png", AssetType.IMAGE);
		
		className.set ("css/default/webview.css", __ASSET__css_default_webview_css);
		type.set ("css/default/webview.css", AssetType.TEXT);
		
		className.set ("css/gradient/webview.css", __ASSET__css_gradient_webview_css);
		type.set ("css/gradient/webview.css", AssetType.TEXT);
		
		className.set ("css/gradient/webview.min.css", __ASSET__css_gradient_webview_min_css);
		type.set ("css/gradient/webview.min.css", AssetType.TEXT);
		
		className.set ("css/webview.css", __ASSET__css_webview_css);
		type.set ("css/webview.css", AssetType.TEXT);
		
		className.set ("assets/css/default/webview.css", __ASSET__assets_css_default_webview_css);
		type.set ("assets/css/default/webview.css", AssetType.TEXT);
		
		className.set ("assets/css/gradient/webview.css", __ASSET__assets_css_gradient_webview_css);
		type.set ("assets/css/gradient/webview.css", AssetType.TEXT);
		
		className.set ("assets/css/gradient/webview.min.css", __ASSET__assets_css_gradient_webview_min_css);
		type.set ("assets/css/gradient/webview.min.css", AssetType.TEXT);
		
		className.set ("assets/css/webview.css", __ASSET__assets_css_webview_css);
		type.set ("assets/css/webview.css", AssetType.TEXT);
		
		className.set ("assets/img/haxe_ui.png", __ASSET__assets_img_haxe_ui_png);
		type.set ("assets/img/haxe_ui.png", AssetType.IMAGE);
		
		className.set ("assets/img/icone_cocktail_blanche_ombre.png", __ASSET__assets_img_icone_cocktail_blanche_ombre_png);
		type.set ("assets/img/icone_cocktail_blanche_ombre.png", AssetType.IMAGE);
		
		className.set ("assets/img/icone_haxe_blanche_ombre.png", __ASSET__assets_img_icone_haxe_blanche_ombre_png);
		type.set ("assets/img/icone_haxe_blanche_ombre.png", AssetType.IMAGE);
		
		className.set ("assets/openfl.svg", __ASSET__assets_openfl_svg);
		type.set ("assets/openfl.svg", AssetType.TEXT);
		
		className.set ("assets/ui/demo.xml", __ASSET__assets_ui_demo_xml);
		type.set ("assets/ui/demo.xml", AssetType.TEXT);
		
		className.set ("assets/ui/example.html", __ASSET__assets_ui_example_html);
		type.set ("assets/ui/example.html", AssetType.TEXT);
		
		className.set ("assets/ui/test.html", __ASSET__assets_ui_test_html);
		type.set ("assets/ui/test.html", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);

		#elseif (js || openfl_html5 || pixi)
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__styles_default_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_default_collapse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_default_cross_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_default_expand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_default_up_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_down_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_right2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_right_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_circle_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_cross_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_gradient_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_gradient_gradient_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_gradient_gradient_mobile_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_gradient_gripper_horizontal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_gripper_vertical_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_accordion_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_accordion_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_buttons_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_buttons_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_calendar_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_hprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_hscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_listview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_listview_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_listview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_menus_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_optionbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_popups_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_rtf_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_scrolls_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_scrolls_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_sliders_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_tabs_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__styles_windows_textinput_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_vprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_vscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__styles_windows_windows_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__img_slinky_small_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_slinky_tiny_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__fonts_oxygen_bold_ttf extends openfl.text.Font { }
@:keep class __ASSET__fonts_oxygen_ttf extends openfl.text.Font { }
@:keep class __ASSET__ui_demo_xml extends openfl.utils.ByteArray { }
@:keep class __ASSET__ui_example_html extends openfl.utils.ByteArray { }
@:keep class __ASSET__ui_test_html extends openfl.utils.ByteArray { }
@:keep class __ASSET__img_haxe_ui_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_icone_cocktail_blanche_ombre_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__img_icone_haxe_blanche_ombre_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__css_default_webview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__css_gradient_webview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__css_gradient_webview_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__css_webview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_css_default_webview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_css_gradient_webview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_css_gradient_webview_min_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_css_webview_css extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_img_haxe_ui_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_img_icone_cocktail_blanche_ombre_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_img_icone_haxe_blanche_ombre_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_openfl_svg extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_ui_demo_xml extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_ui_example_html extends openfl.utils.ByteArray { }
@:keep class __ASSET__assets_ui_test_html extends openfl.utils.ByteArray { }


#elseif html5


































































@:keep class __ASSET__fonts_oxygen_bold_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "fonts/Oxygen-Bold.ttf"; } #end }
@:keep class __ASSET__fonts_oxygen_ttf extends flash.text.Font { #if (!openfl_html5_dom) public function new () { super (); fontName = "fonts/Oxygen.ttf"; } #end }























#elseif (windows || mac || linux)


@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/default/circle.png") class __ASSET__styles_default_circle_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/default/collapse.png") class __ASSET__styles_default_collapse_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/default/cross.png") class __ASSET__styles_default_cross_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/default/expand.png") class __ASSET__styles_default_expand_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/default/up_down.png") class __ASSET__styles_default_up_down_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_down.png") class __ASSET__styles_gradient_arrow_down_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_down_dark.png") class __ASSET__styles_gradient_arrow_down_dark_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_down_disabled.png") class __ASSET__styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_left.png") class __ASSET__styles_gradient_arrow_left_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_left_disabled.png") class __ASSET__styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_right.png") class __ASSET__styles_gradient_arrow_right_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_right2.png") class __ASSET__styles_gradient_arrow_right2_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_right_dark.png") class __ASSET__styles_gradient_arrow_right_dark_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_right_disabled.png") class __ASSET__styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_up.png") class __ASSET__styles_gradient_arrow_up_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/arrow_up_disabled.png") class __ASSET__styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/circle_dark.png") class __ASSET__styles_gradient_circle_dark_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/cross_dark.png") class __ASSET__styles_gradient_cross_dark_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/cross_dark_disabled.png") class __ASSET__styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gradient.css") class __ASSET__styles_gradient_gradient_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gradient.min.css") class __ASSET__styles_gradient_gradient_min_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gradient_mobile.css") class __ASSET__styles_gradient_gradient_mobile_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gripper_horizontal.png") class __ASSET__styles_gradient_gripper_horizontal_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gripper_horizontal_disabled.png") class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gripper_vertical.png") class __ASSET__styles_gradient_gripper_vertical_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/gradient/gripper_vertical_disabled.png") class __ASSET__styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/accordion.css") class __ASSET__styles_windows_accordion_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/accordion.min.css") class __ASSET__styles_windows_accordion_min_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/button.png") class __ASSET__styles_windows_button_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/buttons.css") class __ASSET__styles_windows_buttons_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/buttons.min.css") class __ASSET__styles_windows_buttons_min_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/calendar.css") class __ASSET__styles_windows_calendar_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/checkbox.png") class __ASSET__styles_windows_checkbox_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/container.png") class __ASSET__styles_windows_container_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/down_arrow.png") class __ASSET__styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/hscroll_thumb_gripper_down.png") class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/hscroll_thumb_gripper_over.png") class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/hscroll_thumb_gripper_up.png") class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/left_arrow.png") class __ASSET__styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/right_arrow.png") class __ASSET__styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/up_arrow.png") class __ASSET__styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/vscroll_thumb_gripper_down.png") class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/vscroll_thumb_gripper_over.png") class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/glyphs/vscroll_thumb_gripper_up.png") class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/hprogress.png") class __ASSET__styles_windows_hprogress_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/hscroll.png") class __ASSET__styles_windows_hscroll_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/listview.css") class __ASSET__styles_windows_listview_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/listview.min.css") class __ASSET__styles_windows_listview_min_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/listview.png") class __ASSET__styles_windows_listview_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/menus.css") class __ASSET__styles_windows_menus_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/optionbox.png") class __ASSET__styles_windows_optionbox_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/popup.png") class __ASSET__styles_windows_popup_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/popups.css") class __ASSET__styles_windows_popups_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/rtf.css") class __ASSET__styles_windows_rtf_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/scrolls.css") class __ASSET__styles_windows_scrolls_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/scrolls.min.css") class __ASSET__styles_windows_scrolls_min_css extends flash.utils.ByteArray {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/sliders.css") class __ASSET__styles_windows_sliders_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/tab.png") class __ASSET__styles_windows_tab_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/tabs.css") class __ASSET__styles_windows_tabs_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/textinput.png") class __ASSET__styles_windows_textinput_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/vprogress.png") class __ASSET__styles_windows_vprogress_png extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/vscroll.png") class __ASSET__styles_windows_vscroll_png extends flash.display.BitmapData {}
@:file("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/styles/windows/windows.css") class __ASSET__styles_windows_windows_css extends flash.utils.ByteArray {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/img/slinky_small.jpg") class __ASSET__img_slinky_small_jpg extends flash.display.BitmapData {}
@:bitmap("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/img/slinky_tiny.jpg") class __ASSET__img_slinky_tiny_jpg extends flash.display.BitmapData {}
@:font("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/fonts/Oxygen-Bold.ttf") class __ASSET__fonts_oxygen_bold_ttf extends flash.text.Font {}
@:font("C:/Servers/Haxe/haxe/lib/haxeui/1,4,2/fonts/Oxygen.ttf") class __ASSET__fonts_oxygen_ttf extends flash.text.Font {}
@:file("assets/ui/demo.xml") class __ASSET__ui_demo_xml extends flash.utils.ByteArray {}
@:file("assets/ui/example.html") class __ASSET__ui_example_html extends flash.utils.ByteArray {}
@:file("assets/ui/test.html") class __ASSET__ui_test_html extends flash.utils.ByteArray {}
@:bitmap("assets/img/haxe_ui.png") class __ASSET__img_haxe_ui_png extends flash.display.BitmapData {}
@:bitmap("assets/img/icone_cocktail_blanche_ombre.png") class __ASSET__img_icone_cocktail_blanche_ombre_png extends flash.display.BitmapData {}
@:bitmap("assets/img/icone_haxe_blanche_ombre.png") class __ASSET__img_icone_haxe_blanche_ombre_png extends flash.display.BitmapData {}
@:file("assets/css/default/webview.css") class __ASSET__css_default_webview_css extends flash.utils.ByteArray {}
@:file("assets/css/gradient/webview.css") class __ASSET__css_gradient_webview_css extends flash.utils.ByteArray {}
@:file("assets/css/gradient/webview.min.css") class __ASSET__css_gradient_webview_min_css extends flash.utils.ByteArray {}
@:file("assets/css/webview.css") class __ASSET__css_webview_css extends flash.utils.ByteArray {}
@:file("assets/css/default/webview.css") class __ASSET__assets_css_default_webview_css extends flash.utils.ByteArray {}
@:file("assets/css/gradient/webview.css") class __ASSET__assets_css_gradient_webview_css extends flash.utils.ByteArray {}
@:file("assets/css/gradient/webview.min.css") class __ASSET__assets_css_gradient_webview_min_css extends flash.utils.ByteArray {}
@:file("assets/css/webview.css") class __ASSET__assets_css_webview_css extends flash.utils.ByteArray {}
@:bitmap("assets/img/haxe_ui.png") class __ASSET__assets_img_haxe_ui_png extends flash.display.BitmapData {}
@:bitmap("assets/img/icone_cocktail_blanche_ombre.png") class __ASSET__assets_img_icone_cocktail_blanche_ombre_png extends flash.display.BitmapData {}
@:bitmap("assets/img/icone_haxe_blanche_ombre.png") class __ASSET__assets_img_icone_haxe_blanche_ombre_png extends flash.display.BitmapData {}
@:file("assets/openfl.svg") class __ASSET__assets_openfl_svg extends flash.utils.ByteArray {}
@:file("assets/ui/demo.xml") class __ASSET__assets_ui_demo_xml extends flash.utils.ByteArray {}
@:file("assets/ui/example.html") class __ASSET__assets_ui_example_html extends flash.utils.ByteArray {}
@:file("assets/ui/test.html") class __ASSET__assets_ui_test_html extends flash.utils.ByteArray {}


#end
