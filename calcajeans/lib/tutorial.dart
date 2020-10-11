import 'package:calcajeans/home.dart';

import 'confeccao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Column(
      //body: Container(
         children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                customcard("Máquinas", imagem[0]),
                customcard("Processo de Confecção", imagem[1]),
              ],
            ),
          ),
         
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => home(),
              ));
            },
            //child: Material(
            child: Container(
              padding: EdgeInsets.all(4.0),
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
      ),

      appBar: AppBar(
        title: Text(
          "Tutorial",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => home(),
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
