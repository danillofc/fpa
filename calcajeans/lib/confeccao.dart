import 'package:calcajeans/home.dart';
import 'package:calcajeans/tutorial.dart';
import 'package:flutter/material.dart';
import 'confeccaodescricao.dart';

class confeccao extends StatefulWidget {
  @override
  _confeccaoState createState() => _confeccaoState();
}

class _confeccaoState extends State<confeccao> {
  List<String> imagem = [
    "assets/imagens/moldes.jpg",
    "assets/imagens/frente.jpg",
    "assets/imagens/tras.jpg",
  ];

  Widget customcard(String opcao, String image) {
    return Padding(
      padding: EdgeInsets.all(
        20.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => confeccaodescricao(opcao),
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
      body: Container(
        child: ListView(
          children: <Widget>[
            customcard("Moldes", imagem[0]),
            customcard("Aviamentos frontais", imagem[1]),
            customcard("Aviamentos traseiros", imagem[2]),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text(
          "Confecção",
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Pink',
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
        actions: [
          IconButton(icon: Icon(Icons.home), 
            onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => home(),
            )),
          ),
        ],
      ),
    );
  }
}
