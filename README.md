# ImGuiJsHx
The `ImGuiJsHx` library is a Haxe extern for the JavaScript-generated ImGui Bindings. It offers more flexibility and provides powerful interactions with Web technology. It can be used in conjunction with other frameworks or tools which also target JavaScript and can make for a more feature-complete editing environment for your video games or basic data management.

## Installation and Usage
Download and install this repository or use Haxelib:

```
haxelib git imgui-js https://github.com/storydev/ImGuiHxJs
```

Once installed, you need to copy the contents of the `js` folder into a separate project folder. You may wish to include Haxe source code in this folder, but this is typically outside of the web project.

Once you have a folder, you need to create a separate folder to store your Haxe code.

For example, you may have the following folder structure:

```
haxe/ <- where all the Haxe source code is
www/ <- where your website is
```

Under the Haxe folder, you need to have a `build.hxml` file to determine how to build the source:

```hxml
-cp src
-lib imgui-js
-main Main
-js ../www/src/gen.js
```

Note that the output file matches the file in the `<script>` tag in the HTML file you may have copied into the `www` folder.

If you wish to change the output file name, make sure to change the corresponding `<script>` source path as well.

You can use this in conjunction with Live Server, a Visual Studio Code extension, to live preview your compiled changes.

Once done, write some simple Haxe code under the `src` folder of `haxe`:

```haxe
package;

import imgui.Context;
import imgui.ImGui.*;
import imgui.ImGui;

@:expose
class Main
{

    public static var ctx:Context;

    public static function main()
    {
        ctx = new Context();
        ctx.RenderCallback = render;
    }

    static function render()
    {
        if (ImGui.BeginMainMenuBar())
        {
            if (ImGui.BeginMenu("File"))
            {
                

                ImGui.EndMenu();
            }
        }

        ImGui.EndMainMenuBar();
    }

}
```

You need the `@:expose` meta tag on the `Main` class for the underlying JavaScript code under `main.js` to render your changes correctly.

The `Context` class is an `extern` also found under `src`, which is also required for `main.js` to pick up your callback functions.

Making changes to the way the underlying code functions is at your own risk!

## License
This project is licensed under MIT.