import 'package:calcajeans/confeccao.dart';
import 'package:calcajeans/tutorial.dart';
import 'package:flutter/material.dart';

class confeccaodescricao extends StatelessWidget {
  String maq;
  confeccaodescricao(this.maq);
  String descricao;

  setasset() {
    if (maq == "moldes") {
      descricao = "a maquina pespontadeira é usada para...";
    } else if (maq == "aviamentos frontais") {
      descricao = "a maquina overlock é usada para...";
    } else if (maq == "aviamentos traseiros") {
      descricao = "a maquina interlock é usada para...";
    } else if (maq == "reta") {
      descricao = "a maquina reta é usada para...";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    String data = descricao;
    return page(data: data);
  }
}

class page extends StatefulWidget {
  final String data;

  page({Key key, @required this.data}) : super(key: key);
  @override
  _pageState createState() => _pageState(data);
}

class _pageState extends State<page> {
  final String data;
  _pageState(this.data);

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Material(
        child: Text(
          //mydata[1][i.toString()][k],
          k,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                data, //Texto sobre a confeccao
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  choicebutton('a'),
                  choicebutton('b'),
                  choicebutton('c'),
                  choicebutton('d'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(
                  "showtimer",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => confeccao(),
              ));
            },
            child: Material(
              child: Text(
                "voltar",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                ),
                maxLines: 1,
              ),
              // splashColor: Colors.indigo[700],
              // highlightColor: Colors.indigo[700],
              // minWidth: 200.0,
              // height: 45.0,
              shape: (RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Confeccao",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => tutorial(),
          ));
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
