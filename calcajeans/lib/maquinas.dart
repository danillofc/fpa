import 'package:calcajeans/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quizpage.dart';
import 'flash.dart';
import 'maqdescricao.dart';

class maquinas extends StatefulWidget {
  @override
  _maquinasState createState() => _maquinasState();
}

class _maquinasState extends State<maquinas> {
  List<String> imagem = [
    "assets/imagens/pesp.jpg",
    "assets/imagens/over.jpg",
    "assets/imagens/inter.jpg",
    "assets/imagens/reta.jpg",
  ];

  Widget customcard(String opcao, String image) {
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            // in changelog 1 we will pass the langname name to ther other widget class
            // this name will be used to open a particular JSON file
            // for a particular language
            builder: (context) => maqdescricao(opcao),
          ));
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
          "Máquinas",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),

      body: Column(
      //body: Container(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                customcard("Pespontadeira", imagem[0]),
                customcard("Overlock", imagem[1]),
                customcard("Interlock", imagem[2]),
                customcard("Máquina Reta", imagem[3]),
              ],
            ),
          ),
          
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => tutorial(),
              ));
            },
            //child: Material(
            child: Container(
              // padding: EdgeInsets.all(4.0),
              color: Colors.blue,
              child: Text(
                "voltar",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                ),
                //maxLines: 1,
              ),
              // splashColor: Colors.indigo[700],
              // highlightColor: Colors.indigo[700],
              // minWidth: 200.0,
              // height: 45.0,
              // shape: (RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
        ],
      )
    );
  }
}
