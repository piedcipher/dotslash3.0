import 'package:flutter/material.dart';

import 'package:dartpad_gen_gui/screens/home.dart';
import 'package:dartpad_gen_gui/screens/editor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartpad Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/editor': (context) => EditorScreen(),
      },
    );
  }
}
