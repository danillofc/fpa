import 'package:calcajeans/confeccao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calcajeans/maquinas.dart';

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
          } else if (opcao == "Processo de Confecção") {
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
          "Tutorial",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            customcard("Máquinas", imagem[0]),
            customcard("Processo de Confecção", imagem[1]),
            customcard("333", imagem[1]),
            customcard("444", imagem[0]),
            customcard("555", imagem[1]),
          ],
        ),
      ),
    );
  }
}
