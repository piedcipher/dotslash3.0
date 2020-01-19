import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  TextEditingController textEditingController;
  final String fileName;

  CustomTextFormField({
    this.textEditingController,
    this.fileName,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        maxLines: 15,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF12202F),
          counterText: widget.fileName,
          counterStyle: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
