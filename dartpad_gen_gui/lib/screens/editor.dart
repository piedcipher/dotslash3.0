import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_linkify/flutter_linkify.dart';

import 'package:dartpad_gen_gui/utils/dartpad_gen_cli.dart';
import 'package:dartpad_gen_gui/utils/constants.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class EditorScreen extends StatefulWidget {
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<EditorScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> arguments = ModalRoute.of(context).settings.arguments;
    controller.text = arguments[1];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1C2834),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Text Editor'),
      ),
      body: Container(
        color: Color(0xFF12202F),
        child: TextFormField(
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          maxLines: 100,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFF12202F),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          print('Bruh ${arguments[0]}');
          print('Bruh ${controller.text}');
          final dartpadLink = await DartpadGenerator(
                  fileName: arguments[0], fileContents: controller.text)
              .invokeGenerator();
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (builder) => AlertDialog(
              actions: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('Share'),
                  onPressed: () async {
                    await ShareExtend.share(dartpadLink, 'text');
                  },
                ),
              ],
              title: Text('Dartpad Link'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Linkify(
                      onOpen: (link) async {
                        await launch(dartpadLink);
                      },
                      text: dartpadLink,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        splashColor: Colors.white,
        tooltip: 'Get Link',
        label: Text('Get Link'),
        icon: Icon(Icons.link),
        backgroundColor: Colors.pink,
      ),
    );
  }

  Future compile() async {
    http.Response response = await http.post(
      jsonEncode(
        [
          {
            "url": "https://api.jdoodle.com/v1/execute",
            "Content-Type": "application/json",
            "clientId": "$kClientID",
            "clientSecret": "$kClientSecret",
            "script": "void main() { print('Hi'); }",
            "language": "dart",
            "versionIndex": "3",
          }
        ],
      ),
    );
    print(response.statusCode);
    return jsonDecode(response.body);
  }
}
