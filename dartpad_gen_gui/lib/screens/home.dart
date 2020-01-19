import 'dart:io';

import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C2834),
      appBar: AppBar(
        backgroundColor: Color(0xFF12202F),
        title: Text('Dartpad Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Dart File by clicking on the button',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () async {
          final Map<String, String> _dartFiles =
              await FilePicker.getMultiFilePath(fileExtension: 'dart');
          Navigator.pushNamed(
            context,
            '/editor',
            arguments: _dartFiles,
          );
        },
        tooltip: 'File Picker',
        child: Icon(Icons.library_add),
      ),
    );
  }
}
