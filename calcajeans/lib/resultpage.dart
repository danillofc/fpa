import 'package:calcajeans/home.dart';
import 'package:calcajeans/quizpage.dart';
import 'package:flutter/material.dart';

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

      //body: Center(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //adicionei
        children: <Widget>[
          Container(alignment: Alignment.center,
            child: Text(
              "Você acertou $acertos pergunta(s)",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
        ]
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            IconButton(
              icon: Icon(
                Icons.redo,
                size: 24.0,
              ),
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => quizpage(),
              )),
            ),
            SizedBox(width: 7),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
