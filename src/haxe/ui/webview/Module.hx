package haxe.ui.webview;

import haxe.ui.toolkit.core.interfaces.IModule;
import haxe.ui.toolkit.core.Macros;
import haxe.ui.toolkit.themes.Theme;

class Module implements IModule {
	public function new() {
		
	}
	
	public function init():Void {
		Macros.registerComponentPackage("haxe.ui.webview");
		Theme.addPublicAsset("css/webview.css");
		Theme.addAsset("gradient", "css/gradient/webview.css");
		Theme.addAsset("default", "css/default/webview.css");
	}
}