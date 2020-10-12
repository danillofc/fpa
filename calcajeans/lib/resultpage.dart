import 'package:calcajeans/home.dart';
import 'package:calcajeans/quizpage.dart';
import 'package:flutter/material.dart';
import 'login.dart';


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
            fontSize: 20.0,
            fontFamily: 'Beriberu',
          ),
        ),
        centerTitle: true,
      ),

      //body: Center(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, //adicionei
        children: <Widget>[
          Container(alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5.0),
            width: 300.0, //adicionei
            color: Colors.lightGreen,
            child: Text(
              "Você acertou $acertos pergunta(s)",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Pink',
              ),
            ),
          ),
          SizedBox(height: 7.0),
          Container(
            //height: 40.0, //
            padding: EdgeInsets.symmetric(vertical: 5.0),
            width: 300.0, //adicionei
            //color: Colors.lightGreen,
            child: Text(
              "Registre seu resultado clicando no link abaixo. Servirá para obtermos feedback.",
              style: TextStyle(
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.0),
          Container(alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              //vertical: 2.0,
              horizontal: 20.0,
            ),
            child: MaterialButton(
              onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => telalogin(),
              )),
                child: Text(
                  "Registrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontFamily: 'Pink',
                  ),
                ),
              color: Colors.lightBlue,
              minWidth: 100.0,
              height: 25,
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
        //color: Theme.of(context).primaryColor,
        color: Colors.orange,
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
