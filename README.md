NOTE: This is a legacy unmaintained version of HaxeUI
================================
If you are writing a new application, or are considering moving a legacy application across to the newer version, check out the repository here: https://github.com/haxeui/haxeui-core

Experimental web view component for <a href="https://github.com/ianharrigan/haxeui">HaxeUI</a>
================================

<img src="https://raw.github.com/ianharrigan/haxeui-webview/master/docs/screen.jpg" />

Installation
-------------------------
First install haxeui & haxeui-webview via haxelib:

```
haxelib install haxeui
haxelib install haxeui-webview
```

Once installed add 
```
<haxelib name="haxeui" />
<haxelib name="haxeui-webview" />
```
to your openfl application.xml.

Usage
-------------------------
When your application starts the web view module will auto init and register the classes and add styles.

To use the webview:
	
```xml
<webview width="100%" height="100%" text="asset://ui/example.html" />
```
