import 'package:calcajeans/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
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
    "assets/imagens/interlock.jpg",
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
        ],
      ),

      appBar: AppBar(
        title: Text(
          "Máquinas",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => tutorial(),
            ));
          },
          child: Icon(Icons.arrow_back),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 7),
            IconButton(
              icon: Icon(
                Icons.home,
                size: 24.0,
              ),
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => home(),
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
