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
        backgroundColor: Color(0xFF1C2834),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()
        {Navigator.pop(context);}),
        title: Text('Text Editor'),),
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
        onPressed: () {},
        splashColor: Colors.white,
        tooltip: 'Get Link',
        label: Text('Get Link'),
        icon: Icon(Icons.navigation),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
