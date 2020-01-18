import 'dart:io';
import 'text_editor.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'File Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _file;
  String info = 'Enter info from the file';

  void file_picker() async{
    _file = await FilePicker.getFilePath(fileExtension: 'dart');
    File('$_file').readAsString().then((String contents) {
      setState(() {
        info = contents;
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {return Texteditor(value: '$info',);}));
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Dart File by clicking on the button',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          file_picker();
        },

        tooltip: 'File Picker',
        child: Icon(Icons.library_add),
      ),
    );
  }
}
