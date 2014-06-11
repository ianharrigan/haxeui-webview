package haxe.ui.webview;

import cocktail.api.CocktailView;
import haxe.ui.toolkit.core.Root;
import haxe.ui.toolkit.core.Toolkit;
import haxe.ui.toolkit.themes.GradientTheme;
import haxe.ui.webview.DemoController;

class Main {
	static var cv:CocktailView;
	public static function main() {
		Toolkit.theme = new GradientTheme();
		Toolkit.init();
		Toolkit.openFullscreen(function(root:Root) {
			root.addChild(new DemoController().view);
		});
	}
}
