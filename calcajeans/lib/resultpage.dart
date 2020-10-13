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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[
          Container(alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5.0),
            width: 300.0, 
            color: Colors.orange[200],
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
            padding: EdgeInsets.symmetric(vertical: 5.0),
            width: 300.0, 
            child: Text(
              "Registre seu resultado clicando no link abaixo. Servirá como feedback.",
              style: TextStyle(
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.0),
          Container(alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: MaterialButton(
              onPressed: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Telalogin(),
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

      appBar: AppBar(
        title: Text(
          "Resultado",
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Pink',
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
