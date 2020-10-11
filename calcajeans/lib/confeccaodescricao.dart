import 'package:flutter/material.dart';
import 'confeccao.dart';
import 'home.dart';
import 'tutorial.dart';

class confeccaodescricao extends StatelessWidget {
  String conf;
  confeccaodescricao(this.conf);
  String descricao;
  String image;

  setasset() {
    if (conf == "Moldes") {
      descricao = "Os moldes são ...";
      image = "assets/imagens/moldes.png";
    } else if (conf == "Aviamentos frontais") {
      descricao = "Os aviamentos frontais são...";
      image = "assets/imagens/aviamentofrontal.png";
    } else if (conf == "Aviamentos traseiros") {
      descricao = "Os aviamentos traseiros são ...";
      image = "assets/imagens/aviamentotraseiro.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    String data = descricao;
    String item = conf;
    String imagem = image;
    return page(data: data, item: item, imagem: imagem);
  }
}

class page extends StatefulWidget {
  final String data;
  final String item;
  final String imagem;

  page(
      {Key key,
      @required this.data,
      @required this.item,
      @required this.imagem})
      : super(key: key);
  @override
  _pageState createState() => _pageState(data, item, imagem);
}

class _pageState extends State<page> {
  final String data;
  final String item;
  final String imagem;
  _pageState(this.data, this.item, this.imagem);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: ListView(
                children: <Widget>[
                  Image(
                    image: AssetImage(
                      imagem,   //Imagem da máquina
                    ),
                  ),
                  Text(
                    data, //Texto sobre a máquina
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      appBar: AppBar(
        title: Text(
          item,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => confeccao(),
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
