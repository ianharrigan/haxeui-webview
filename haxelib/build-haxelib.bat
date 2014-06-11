copy ..\haxelib.json .\
copy ..\include.xml .\
del haxeui-webview.zip
7za a haxeui-webview.zip haxelib.json include.xml ../assets/ ../src/haxe