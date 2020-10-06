import 'package:flutter/material.dart';
import 'confeccaodescricao.dart';

class confeccao extends StatefulWidget {
  @override
  _confeccaoState createState() => _confeccaoState();
}

class _confeccaoState extends State<confeccao> {
  List<String> imagem = [
    "assets/imagens/moldes.png",
    "assets/imagens/aviamentofrontal.png",
    "assets/imagens/aviamentotraseiro.png",
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
          "Confecção",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            customcard("moldes", imagem[0]),
            customcard("aviamentos frontais", imagem[1]),
            customcard("aviamentos traseiros", imagem[2]),
          ],
        ),
      ),
    );
  }
}
