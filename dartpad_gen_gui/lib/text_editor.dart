import 'package:flutter/material.dart';

class Texteditor extends StatefulWidget {

  Texteditor({this.value});
  final String value;

  @override
  _TexteditorState createState() => _TexteditorState();
}

class _TexteditorState extends State<Texteditor> {
  final controller = TextEditingController();


  @override
  void initState(
      ) {
    super.initState();
    controller.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()
        {Navigator.pop(context);}),
        title: Text('Text Editor'),),
      body: TextFormField(
        maxLines: 100,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black54
        ),
      ),
    );
  }
}
