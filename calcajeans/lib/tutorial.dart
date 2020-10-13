import 'package:calcajeans/home.dart';
import 'confeccao.dart';
import 'package:flutter/material.dart';
import 'maquinas.dart';

class tutorial extends StatefulWidget {
  @override
  _tutorialState createState() => _tutorialState();
}

class _tutorialState extends State<tutorial> {
  List<String> imagem = [
    "assets/imagens/maq.jpg",
    "assets/imagens/jeans.jpg",
  ];

  Widget customcard(String opcao, String image) {
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: () {
          if (opcao == "Máquinas") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => maquinas(),
            ));
          } else if (opcao == "Confecção") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => confeccao(),
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
                      fontFamily: 'Pink',
                    ),
                  ),
                ),
                SizedBox(height: 6.0),
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
                customcard("Máquinas", imagem[0]),
                customcard("Confecção", imagem[1]),
              ],
            ),
          ),
        ],
      ),

      appBar: AppBar(
        title: Text(
          "Tutorial",
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Pink',
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => home(),
            ));
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
