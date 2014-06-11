package haxe.ui.webview;

import haxe.ui.toolkit.core.XMLController;
import haxe.ui.toolkit.events.UIEvent;

@:build(haxe.ui.toolkit.core.Macros.buildController("ui/demo.xml"))
class DemoController extends XMLController {
	public function new() {
		attachEvent("goButton", UIEvent.CLICK, function(e:UIEvent) {
			getComponentAs("webView", WebView).url = getComponent("address").text;
		});
	}
}