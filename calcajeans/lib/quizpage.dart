import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:calcajeans/home.dart';
import 'package:calcajeans/resultpage.dart';
import 'package:calcajeans/home.dart';

class quizpage extends StatelessWidget {
  String assetjson;
  setasset() {
    assetjson = "assets/perguntas.json";
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assetjson, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return quizpage2(mydata: mydata);
        }
      },
    );
  }
}

class quizpage2 extends StatefulWidget {
  final List mydata;

  quizpage2({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpage2State createState() => _quizpage2State(mydata);
}

class _quizpage2State extends State<quizpage2> {
  final List mydata;
  _quizpage2State(this.mydata);

  Color colortoshow = Colors.blue;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int acertos = 0;
  int i = 1;

  Map<String, Color> btncolor = {
    "a": Colors.blueGrey,
    "b": Colors.blueGrey,
    "c": Colors.blueGrey,
    "d": Colors.blueGrey,
  };

  void next() {
    setState() {
      if (i < 9) {
        i = i + 1;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(acertos: acertos),
        ));
      }
      btncolor["a"] = Colors.blueGrey;
      btncolor["b"] = Colors.blueGrey;
      btncolor["c"] = Colors.blueGrey;
      btncolor["d"] = Colors.blueGrey;
    }
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      acertos = acertos + 1;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });
    Timer(Duration(seconds: 2), next);
  }

  Widget botao(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        color: Colors.yellow,
        minWidth: 200.0,
        height: 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                mydata[0][i.toString()],
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                children: <Widget>[
                  botao("a"),
                  botao("b"),
                  botao("c"),
                  botao("d"),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
