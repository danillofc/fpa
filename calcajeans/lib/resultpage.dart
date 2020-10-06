import 'package:flutter/material.dart';
import 'quizpage.dart';

class resultpage extends StatefulWidget {
  int acertos;
  resultpage({Key key, @required this.acertos}) : super(key: key);
  @override
  _resultpageState createState() => _resultpageState(acertos);
}

class _resultpageState extends State<resultpage> {
  int acertos;
  _resultpageState(this.acertos);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultado",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Você acertou $acertos pergunta(s)",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
