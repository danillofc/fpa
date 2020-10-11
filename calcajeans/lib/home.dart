import 'package:flutter/material.dart';
import 'quizpage.dart';
import "tutorial.dart";

class home extends StatefulWidget {
  
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> imagem = [
    "assets/icones/tutorial.jpg",
    "assets/icones/quiz.jpg",
  ];

  Widget customcard(String opcao, String image) {
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: () {
          if (opcao == "Quiz") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => quizpage(),
            ));
          } else if (opcao == "Tutorial") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => tutorial(),
            ));
          }
        },
        child: Material(
          elevation: 10.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: Image(
                        image: AssetImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    opcao,
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            customcard("Tutorial", imagem[0]),
            customcard("Quiz", imagem[1]),
          ],
        ),
      ),
    );
  }
}
