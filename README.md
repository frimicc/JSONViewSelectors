# JSONViewSelectors
A macOS command-line application written in Swift.

## Problem Statement
Write a command line program in a language of your choosing that parses the following JSON file from stdin or from command line argument:

https://github.com/jdolan/quetoo/blob/master/src/cgame/default/ui/settings/SystemViewController.json
https://raw.githubusercontent.com/jdolan/quetoo/master/src/cgame/default/ui/settings/SystemViewController.json

Your program may assume that the file resides locally on the same filesystem as the program itself, or it may retrieve it via web request if you prefer.

The JSON file represents a view hierarchy in a user interface. You can think of it as a tree of nodes, just like elements in an HTML DOM. Like in HTML, Views have certain attributes that are selectable, ala CSS selectors.

Once parsed, your program should wait for user input on stdin. Each line the user enters on stdin should be treated as a selector, and your program should print the matching views, as JSON, to stdout.

The program must support simple selectors for the following view attributes:

1.     class - The view class name, e.g. "StackView"
2.     classNames - CSS class names, e.g. ".container"
3.     identifier - The view identifier, e.g. "#videoMode"

You can effectively ignore all other attributes in the JSON model for the purpose of selector matching.

Compound selectors (e.g. " View#identifier") are not required, but you’ll certainly impress us if you support them.  Selector chains (e.g. " StackView .container") are not required, but again, you’ll certainly impress us if you support those, too.

There are 26 views in the given JSON file with the class of Input. Ensure the correctness of your program by asserting that it finds all 26 Inputs given the selector "Input".

## Running the Code in Xcode

Since this is a MacOS (Swift) application, it needs to be compiled before running.

1. `git clone https://github.com/frimicc/JSONViewSelectors.git`
2. `cd JSONViewSelectors`
3. `open JSONViewSelectors/JSONViewSelectors.xcodeproj`
4. Click on the triangle to Build & Run.
5. The console, STDIN and STDOUT, is the right-hand pane that pops up at the bottom of the center section of Xcode.
6. Click in that box twice to get an insertion point so you can type.

## Running the Code in Terminal

Xcode builds the app in its own directories, not in the project directory. To find it follow the steps for running
in Xcode and then:

1. Type `q` to stop the program in the console.
2. Choose the folder icon in the upper left of Xcode, or type `cmd-1`.
3. Open the disclosure triangle for "Products" in the left sidebar.
4. Select the "JSONViewSelectors" under "Products".
5. Show the right sidebar, if it isn't already showing, and choose the file icon. (Or type `cmd-opt-1`.
6. Select the "Full Path" for the executable from the right sidebar.
7. Open a Terminal window and paste in the path to the executable. It should run and show usage info.
8. To use the testing database file, add `--db https://raw.githubusercontent.com/jdolan/quetoo/master/src/cgame/default/ui/settings/SystemViewController.json` to the command.

Have fun!
