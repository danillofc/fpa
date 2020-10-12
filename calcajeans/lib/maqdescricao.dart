import 'package:flutter/material.dart';
import 'home.dart';
import 'maquinas.dart';

class maqdescricao extends StatelessWidget {
  String maq;
  maqdescricao(this.maq);
  String descricao;
  String image;

  setasset() {
    if (maq == "Pespontadeira") {
      descricao =
          "A máquina Pespontadeira serve para fazer pesponto em peças costuradas na Interlock, e também para aplicação de bolsos. Seus pontos são iguais aos da máquina Reta com a função de retrocesso. Uma diferença entre pespontadeiras são os alternadores, que permitem que certos pontos sejam costurados com uma agulha apenas, para facilitar a aplicação dos bolsos.";
      image = "assets/imagens/pesp.jpg";
    } else if (maq == "Overlock") {
      descricao =
          "   A máquina Overlock serve para o fechamento das peças, substituindo o chuleado a mão. Ela pode ser utilizada na maioria dos tecidos, porém a preferência é que sejam utilizadas em malhas e tecidos leves. Tecidos pesados devem ser confeccionados na máquina Interlock. Uma variação da máquina Overlock é a ponto cadeia, que possui uma segunda agulha dando reforço na costura.";
      image = "assets/imagens/over.jpg";
    } else if (maq == "Interlock") {
      descricao =
          "   A máquina Interlock possui função parecida com a Overlock, porém vem com duas linhas a mais, fazendo uma costura parecida com a da máquina Reta. Esta costura facilita a dobra do tecido no momento de fazer o pesponto.";
      image = "assets/imagens/interlock.jpg";
    } else if (maq == "Máquina Reta") {
      descricao =
          "   A máquina Reta é a máquina mais comum entre as costureiras, pois a maioria das peças deve ser costurada nela. Essa máquina possui um único tipo de ponto, podendo utilizar a função de retrocesso. Hoje em dia também encontramos o modelo eletrônico, em que se realiza o corte do fio e o retrocesso na máquina apenas utilizando o pedal.";
      image = "assets/imagens/reta.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    String data = descricao;
    String maquina = maq;
    String imagem = image;
    return page(data: data, maquina: maquina, imagem: imagem);
  }
}

class page extends StatefulWidget {
  final String data;
  final String maquina;
  final String imagem;

  page({Key key, @required this.data, @required this.maquina,@required this.imagem})
      : super(key: key);
  @override
  _pageState createState() => _pageState(data, maquina, imagem);
}

class _pageState extends State<page> {
  final String data;
  final String maquina;
  final String imagem;
  _pageState(this.data, this.maquina, this.imagem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
          //Container(
            //flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: ListView(
                children: <Widget>[
                  Container(
                  //adicionei
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  height: 200.0, //adicionei
                  width: 200.0, //adicionei
                  color: Colors.grey,
                  child:Image(
                    image: AssetImage(
                      imagem,   //Imagem da máquina
                    ),
                  ),
                  ),
                  SizedBox(height: 14.0),
                  Text(
                    data, //Texto sobre a máquina
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      
      appBar: AppBar(
        title: Text(
          //"Máquinas",
          maquina,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Beriberu',
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => maquinas(),
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
