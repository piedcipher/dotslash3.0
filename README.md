<h1 align="center">Dartpad Generator</h1>

<h4 align="center">Built with :heart: at <a href="https://hackdotslash.co.in/">DotSlash</a></h4>

<p align="center"><img src="https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/logo.png" alt="logo"></p>

<h2 align="center">Creating <a href="https://dartpad.dev">Dartpad</a> Snippets Made Easy :dart:</h2>

## Team
Teen Tigada Kaam Bigada

## Theme
Developer Tool

## Problem Statement
- [Dartpad](https://dartpad.dev) is a service by Google to run Dart & Flutter code online (web app), without installing any special softwares.

![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/1.png)

- If you want to share link to your awesome dartpad code then you've to create a [Gist](https://gist.github.com) first. Then from the url of the gist, you need to copy **id** and append it to https://dartpad.dev/<gist-id> to share your dartpad code's link.
    
![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/2.png)

![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/3.png)

![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/4.png)

- This is process is very time consuming and involves unnecessary steps. https://github.com/dart-lang/dart-pad/wiki/Sharing-Guide

## Proposed Solutions
🥁🥁
**Introducing Dartpad Generator**, to easily share Dartpad snippets without any hassles.

- Dartpad Generator can be accessed via Mobile app, CommandLine App or VSCode Extension.
- underneath the hood it makes a POST HTTP call to gist API to generate sharable dartpad :link: and does the heavy lifting for you.
- Built for Developers by Developers :blue_heart:

## TechStack
- [CLI App](https://github.com/piedcipher/dotslash3.0/tree/master/dartpad_gen_cli)
    - Dart
    
- [Mobile App](https://github.com/piedcipher/dotslash3.0/tree/master/dartpad_gen_gui)
    - Dart
    - Flutter

- [VSCode Extension](https://github.com/piedcipher/dotslash3.0/tree/master/dartpad_gen_vscode)
    - TypeScript
    
## Demos
- VSCode

![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/vscode_demo.gif)

- CLI

![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/cli_demo.gif)

- Mobile

![](https://raw.githubusercontent.com/piedcipher/dotslash3.0/master/readme-media/mobile_demo.gif)
    
## Dart/Flutter Dependencies
- [http](https://pub.dev/packages/http)

- [file_picker](https://pub.dev/packages/file_picker)

- [meta](https://pub.dev/packages/meta)

- [flutter_linkify](https://pub.dev/packages/flutter_linkify)

- [share_extend](https://pub.dev/packages/share_extend)

- [url_launcher](https://pub.dev/packages/url_launcher)

## Development Setup
- Clone This Repository

- CLI App
    ```
    $ cd dartpad_gen_cli/
    $ pub get
    ```
    
    - Add [Personal Access Token](https://github.com/settings/tokens) with gist scope [here](https://github.com/piedcipher/dotslash3.0/blob/master/dartpad_gen_cli/lib/authtoken.dart)
    
    ```
    $ cd bin/
    $ dart2native main.dart -o dartpadgen.dart
    $ ./dartpadgen.dart file1.dart file2.dart ... [fileN.dart]
    ```

- VSCode Extension
    ```
    $ cd dartpad_gen_vscode/dartpad-generator/
    $ npm install
    $ code .
    ```
    
    - Add [Personal Access Token](https://github.com/settings/tokens) with gist scope [here](https://github.com/piedcipher/dotslash3.0/blob/master/dartpad_gen_vscode/dartpad-generator/src/authToken.ts)
    - Press `F5` to Build
    - Open a Dart File
    - Press `Ctrl + Shift + P` > `Dartpad Generator`
    
- Mobile App
    ```
    $ cd dartpad_gen_gui/
    $ flutter pub get
    ```
    
    - Add [Personal Access Token](https://github.com/settings/tokens) with gist scope [here](https://github.com/piedcipher/dotslash3.0/blob/master/dartpad_gen_gui/lib/utils/authtoken.dart)
    
    ```
    $ flutter run
    ```

## Contributing
Feel free to contribute to the project by creating [issues](https://github.com/piedcipher/dotslash3.0/issues) or sending pull-requests.

## Getting Started
A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
