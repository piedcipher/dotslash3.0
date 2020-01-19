import 'dart:io';

import 'package:dartpad_gen_gui/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

import 'package:flutter_linkify/flutter_linkify.dart';

import 'package:dartpad_gen_gui/utils/dartpad_gen_cli.dart';
import 'package:share_extend/share_extend.dart';
import 'package:url_launcher/url_launcher.dart';

class EditorScreen extends StatefulWidget {
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<EditorScreen> {
  List<CustomTextFormField> _customTextFormFieldsList = [];
  List _finalDartLinks = [];

  @override
  Widget build(BuildContext context) {
    final Map<String, String> dartFiles =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFF12202F),
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
      body: ListView(
        children: dartFiles.keys.map((dartFile) {
          final customTextFormField = CustomTextFormField(
            fileName: dartFile,
            textEditingController: TextEditingController()
              ..text = File(dartFiles[dartFile]).readAsStringSync(),
          );
          _customTextFormFieldsList.add(customTextFormField);
          return customTextFormField;
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          int i = -1;
          dartFiles.keys.forEach((dartFile) async {
            i++;
            final link = await DartpadGenerator(
                    fileName: dartFile,
                    fileContents:
                        _customTextFormFieldsList[i].textEditingController.text)
                .invokeGenerator();
            print('Bruh $link');
          });
        },
        splashColor: Colors.white,
        tooltip: 'Get Link',
        label: Text('Get Link'),
        icon: Icon(Icons.link),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
