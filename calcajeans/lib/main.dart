import 'package:flutter/material.dart';
import 'flash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calça Jeans",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: telaflash(),
    );
  }
}
