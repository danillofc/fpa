import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:convert';
import 'resultpage.dart';
import 'home.dart';

class quizpage extends StatefulWidget {
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
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
  int j = 1;
  //int questao_index = 1; //adicionei em 01/10
  var random_array;

  Map<String, Color> btncolor = {
    "a": Colors.blueGrey,
    "b": Colors.blueGrey,
    "c": Colors.blueGrey,
    "d": Colors.blueGrey,
  };

  genrandomarray() {
    var distinctIds = [];
    var rand = new Random();
    for (int t = 0;;) {
      //distinctIds.add(1+rand.nextInt(10));
      distinctIds.add(1+rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if (random_array.length < 10) {
        continue;
      } else {
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {
    genrandomarray();
    super.initState();
  }

  void next() {
    setState(() {
      if (j < 10) {
        i = random_array[j]; //Número da pergunta
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(acertos: acertos),
        ));
      }
      btncolor["a"] = Colors.blueGrey;
      btncolor["b"] = Colors.blueGrey;
      btncolor["c"] = Colors.blueGrey;
      btncolor["d"] = Colors.blueGrey;
    });
    //next();
  }

  void checkanswer(String k) {
    if (mydata[3][i.toString()] == mydata[2][i.toString()][k]) {
      acertos = acertos + 1;
      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      btncolor[k] = colortoshow;
    });
    Timer(Duration(milliseconds: 800), next); //mudei 
  }

  Widget botao(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[2][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontFamily: 'Sanlulus',
          ),
        ),
        color: btncolor[k],
        minWidth: 200.0,
        //height: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //PERGUNTA(IMAGEM)
          Container(
            //flex: 6,
            child: Padding(
              //adicionei
              padding: EdgeInsets.symmetric(vertical: 5.0), //adicionei
              child: Material(
                //adicionei
                child: Container(
                  //adicionei
                  height: 200.0, //adicionei
                  width: 200.0, //adicionei
                  color: Colors.grey,
                  child: Image(
                    image: AssetImage(
                      mydata[0][i.toString()],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //PERGUNTA(TEXTO)
          Container(
            //Expanded(
            //height: 60.0, //adicionei
            //width: 200.0, //adicionei
            color: Colors.green,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              //alignment: Alignment.bottomLeft,
              child: Text(
                mydata[1][i.toString()],
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),

          //ALTERNATIVAS
          //Expanded(
          Container(
            //height: 60.0, //adicionei
            //flex: 3,
            //child: Container(
              child: Column(
                children: <Widget>[
                  botao("a"),
                  botao("b"),
                  botao("c"),
                  botao("d"),
                ],
              ),
            ),
          //),
        ],
      ),
      appBar: AppBar(
        toolbarHeight: 35.0,
        title: Text(
          "Quiz",
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Beriberu',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.home), 
            onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => home(),
            )),
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
