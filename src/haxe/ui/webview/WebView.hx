package haxe.ui.webview;

import cocktail.api.CocktailView;
import cocktail.core.css.CSSData.PropertyOriginValue;
import cocktail.core.css.CSSStyleSheet;
import haxe.ui.toolkit.containers.ScrollView;
import haxe.ui.toolkit.controls.Button;
import haxe.ui.toolkit.controls.TextInput;
import haxe.ui.toolkit.core.interfaces.InvalidationFlag;
import haxe.ui.toolkit.events.UIEvent;
import haxe.ui.toolkit.resources.ResourceManager;
import haxe.ui.toolkit.style.Style;
import haxe.ui.toolkit.style.StyleManager;
import openfl.geom.Rectangle;

class WebView extends ScrollView {
	private var _cv:CocktailView;
	private var _url:String;
	
	public function new() {
		super();
		virtualScrolling = true;
		_cv = new CocktailView();
		
		addEventListener(UIEvent.SCROLL, _onScroll);
	}
	
	public override function initialize():Void {
		super.initialize();

		/*
		var html:String = ResourceManager.instance.getText("assets/index.html");
		_cv.loadHTML(html);
		_cv.window.onload = function(e) {
			sprite.addChild(_cv.root);
		}
		*/
	}
	
	//******************************************************************************************
	// Overridables
	//******************************************************************************************
	public override function invalidate(type:Int = InvalidationFlag.ALL, recursive:Bool = false):Void {
		if (!_ready || _invalidating) {
			return;
		}

		super.invalidate(type, recursive);
		_invalidating = true;
		if (type & InvalidationFlag.SIZE == InvalidationFlag.SIZE) {
			updateCocktailView();
		}
		_invalidating = false;
	}
	
	private function _onScroll(event:UIEvent):Void {
		_cv.document.documentElement.scrollTop = Std.int(vscrollPos);
	}
	
	private function updateCocktailView():Void {
		if (_cv == null || _cv.document == null) {
			return;
		}

		vscrollMax = _cv.document.documentElement.scrollHeight - layout.usableHeight;
		vscrollPageSize = layout.usableHeight;
		
		var cx:Int = Std.int(layout.usableWidth);
		var cy:Int = Std.int(layout.innerHeight);
		if (cx <= 0 || cy <= 0) {
			return;
		}
		_cv.viewport = { x: Std.int(layout.padding.left), y: Std.int(layout.padding.top), width: cx, height: cy };
		_cv.root.scrollRect = new Rectangle(0, 0, layout.usableWidth, layout.usableHeight);
	}
	
	private override function set_text(value:String):String {
		value = super.set_text(value);
		_cv.loadHTML(value);
		_cv.window.onload = function(e) {
			if (sprite.contains(_cv.root) == false) {
				sprite.addChild(_cv.root);
			}
			_cv.document.addStyleSheet(buildThemeStyleSheet());
		}
		return value;
	}
	
	public var url(get, set):String;
	private function get_url():String {
		return _url;
	}
	
	private function set_url(value:String):String {
		_url = value;
		_cv.loadURL(_url);
		_cv.window.onload = function(e) {
			try {
				if (sprite.contains(_cv.root) == false) {
					sprite.addChild(_cv.root);
				}
			} catch (e:Dynamic) {
				trace(e);
			}
		}
		return value;
	}
	
	private function buildThemeStyleSheet():CSSStyleSheet {
		var button:Style = StyleManager.instance.buildStyleFor(new Button());
		var button_hover:Style = StyleManager.instance.buildStyleFor(new Button(), Button.STATE_OVER);
		var button_active:Style = StyleManager.instance.buildStyleFor(new Button(), Button.STATE_DOWN);
		var button_disabled:Style = StyleManager.instance.buildStyleFor(new Button(), Button.STATE_DISABLED);
		
		var textfield:Style = StyleManager.instance.buildStyleFor(new TextInput());
		
		var s:String = "";
		
		s += "html, body {";
		s += "	overflow-x:scroll;overflow-y:scroll;";
		s += "}";
		
		s += "input[type=button], input[type=reset], input[type=submit] {";
		s += "	font:" + button.fontSize + "px arial;";
		s += "	text-align:center;";
		s += "	color:#" + StringTools.hex(button.color, 6) + ";";
		s += "	padding-top:" + button.paddingTop + "px;";
		s += "	padding-bottom:" + button.paddingBottom + "px;";
		s += "	padding-left:" + button.paddingLeft + "px;";
		s += "	padding-right:" + button.paddingRight + "px;";
		s += "	border:1px #" + StringTools.hex(button.borderColor, 6) + " solid;";
		s += "	background-color: #" + StringTools.hex(button.backgroundColor, 6) + ";";
		s += "	outline:none;";
		s += "}";
		
		s += "input[type=button]:hover, input[type=reset]:hover, input[type=submit]:hover {";
		s += "	color:#" + StringTools.hex(button_hover.color, 6) + ";";
		s += "	border:1px #" + StringTools.hex(button_hover.borderColor, 6) + " solid;";
		s += "	background-color: #" + StringTools.hex(button_hover.backgroundColor, 6) + ";";
		s += "}";

		s += "input[type=button]:active, input[type=reset]:active, input[type=submit]:active {";
		s += "	color:#" + StringTools.hex(button_active.color, 6) + ";";
		s += "	border:1px #" + StringTools.hex(button_active.borderColor, 6) + " solid;";
		s += "	background-color: #" + StringTools.hex(button_active.backgroundColor, 6) + ";";
		s += "}";

		s += "input[type=button]:disabled, input[type=reset]:disabled, input[type=submit]:disabled {";
		s += "	color:#" + StringTools.hex(button_disabled.color, 6) + ";";
		s += "	border:1px #" + StringTools.hex(button_disabled.borderColor, 6) + " solid;";
		s += "	background-color: #" + StringTools.hex(button_disabled.backgroundColor, 6) + ";";
		s += "}";

		s += "input[type=text], input[type=password] {";
		s += "	width:150px;";
		s += "	height:20px;";
		s += "	padding-top: 3px;";
		s += "	padding-bottom: 3px;";
		s += "	padding-left: 0px;";
		s += "	padding-right: 0px;";
		s += "	color:#" + StringTools.hex(textfield.color, 6) + ";";
		s += "	border:1px #" + StringTools.hex(textfield.borderColor, 6) + " solid;";
		s += "	background-color: #" + StringTools.hex(textfield.backgroundColor, 6) + ";";
		s += "	outline: none;";
		s += "}";
		
		return new CSSStyleSheet(s, PropertyOriginValue.AUTHOR);
	}
}