
![Screenshot](.readme/image.png)

# ofVSCode

Quick [openFrameworks](https://openframeworks.cc/) workspace initializer for [Visual Studio Code](https://code.visualstudio.com/).

Fork of [vscode_oF](https://github.com/hiroMTB/vscode_oF) by [@hiroMTB](https://github.com/hiroMTB) modified for Arch systems.

This is not an addon, although the name suggests it is.

This project is intended to quickly initiate a vscode workspace in an existing or empty project or an addon example.
Using the provided alias it is also possible to initiate a fresh openframeworks project.

It relies on the use of of **aliases** and command chaining in terminal to circumvent `git clone <repo> .`'s restrictions in a non empty directory.
  

# Example Usage:

After adding the alias to your shell config (in my case zsh) you can run `ofxvsc` in your current existing project.

This is particularly useful for quickly initiating addon examples for testing, without the need to go through the projectGenerator.

```
alias ofcode="git clone https://github.com/hsab/ofVSCode.git && mv ./ofVSCode/.vscode/ ./ && mv ./ofVSCode/.gitignore ./ && mv -n ./ofVSCode/addons.make ./ && mv -n ./ofVSCode/config.make ./ && mv -n ./ofVSCode/Makefile ./ && mv -n ./ofVSCode/src/ ./ &&  rm -rf ./ofVSCode"
```

If you'd like to immediately open the project in VSCode after initiation use the following alias instead:
```
alias ofcode="git clone https://github.com/hsab/ofVSCode.git && mv ./ofVSCode/.vscode/ ./ && mv ./ofVSCode/.gitignore ./ && mv -n ./ofVSCode/addons.make ./ && mv -n ./ofVSCode/config.make ./ && mv -n ./ofVSCode/Makefile ./ && mv -n ./ofVSCode/src/ ./ &&  rm -rf ./ofVSCode && code ./ &"
```


Running the above alias will:
1. Create a `.vscode` workspace folder and `.gitignore` in your current directory.
2. Create fresh `Makefile`, `addons.make`, and `config.make ` **if they don't already exist** in your current directory.
3. Create a `src` folder with an empty project including `main.cpp`, `ofApp.cpp`, and `ofApp.h` **if they don't already exist** in your current directory.
4. Remove `ofxVSCode` folder entirely.


**Note:** By default the include and libraries are linked such that the project is in the `myApps` directory:
- Correct: `openframeworks/apps/myApps/yourProject/`

This structure is my personal preference, because addon examples can easily be compile and initiated using the same technique. You can fork the repository and appropriately change every instance of `${workspaceRoot}/../../../` in the `c_cpp_properties.json` file if you need a different directory configuration.

  

# Addons How-to:
1. Edit addons.make file if you want to add addons.
2. You might need to edit the `c_cpp_properties.json` file.
  
  

# Features
- Automatic path checking to ensure correct folder structure by running the `Check Paths` task.
- Auto code completion (Requires [Microsoft C++ extension](https://code.visualstudio.com/docs/languages/cpp)).
- Step by step debugging (requires [gdb](https://www.gnu.org/software/gdb/) or similar debugger).
- Browse source code under `/libs/openFrameworks` and `/addons/*` folders.
- Currently tested on macOS, Ubuntu(by @anselanza), and Arch (Manjaro).

  
## Folder Structure

```
/of
  /apps
    /myApps
      /exampleProject <--
```

## oF version
0.10.0

  
## Known issue (copied from the original repo)

+ Rebuilding does not work properly. As a fix prior to running the task, **only** the binary file(s) is removed:
  - Build Debug: <pre>rm -f <b>./bin/$(basename '$PWD')_debug</b> && make <b>Debug</b> -j$(nproc)</pre>
  - Build Release: <pre>rm -f <b>./bin/$(basename '$PWD')</b> && make <b>Release</b> -j$(nproc)</pre>
+ macOS.sdk path is hard coded
+ `#include error detected` for header files which is not actualy included. For example `GL/gl.h` is for Linux wihch is not included on macOS. This shold be fixed with `limitSymbolsToIncludedHeaders` property in `c_cpp_properties.json`.

