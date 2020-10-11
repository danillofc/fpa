import 'package:flutter/material.dart';
import 'confeccao.dart';
import 'home.dart';
import 'tutorial.dart';

class confeccaodescricao extends StatelessWidget {
  String conf;
  confeccaodescricao(this.conf);
  String descricao;
  String image;
  String image2;

  setasset() {
    if (conf == "Moldes") {
      descricao =
          "   Os moldes são peças que representam as partes do modelo da calça, retirados da modelagem, que foi desenvolvida sobre as bases.  ...";
      image = "assets/imagens/moldes.png";
      image2 = "assets/imagens/moldes.png";
    } else if (conf == "Aviamentos frontais") {
      descricao = "Os aviamentos frontais são...";
      image = "assets/imagens/av_f.jpg";
      image2 = "assets/imagens/av_f.jpg";
    } else if (conf == "Aviamentos traseiros") {
      descricao = "Os aviamentos traseiros são ...";
      image = "assets/imagens/av_t.jpg";
      image2 = "assets/imagens/av_t.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    String data = descricao;
    String item = conf;
    String imagem = image;
    String imagem2 = image2;
    return page(data: data, item: item, imagem: imagem, imagem2: imagem2);
  }
}

class page extends StatefulWidget {
  final String data;
  final String item;
  final String imagem;
  final String imagem2;

  page(
      {Key key,
      @required this.data,
      @required this.item,
      @required this.imagem,
      @required this.imagem2})
      : super(key: key);
  @override
  _pageState createState() => _pageState(data, item, imagem, imagem2);
}

class _pageState extends State<page> {
  final String data;
  final String item;
  final String imagem;
  final String imagem2;
  _pageState(this.data, this.item, this.imagem, this.imagem2);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            //flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              color: Colors.red,
              //alignment: Alignment.bottomLeft,
              child: ListView(
              //child: PageView(  
                children: <Widget>[
                  Container(
                    //adicionei
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    height: 200.0, //adicionei
                    //width: 200.0, //adicionei
                    color: Colors.green,
                    //child: ListView(
                    child: PageView( 
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          height: 200.0, //adicionei
                          width: 200.0, //adicionei
                          color: Colors.grey,
                          child: Image(
                            image: AssetImage(
                              imagem, //Imagem da parte
                            ),
                          ),
                        ),
                        Container(
                          height: 200.0, //
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          width: 200.0, //adicionei
                          color: Colors.yellow,
                          child: Image(
                            image: AssetImage(
                              imagem2, //Imagem2 da parte
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    data, //Texto sobre a parte
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
          item,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
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
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
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

// var bannerItems = ["1", "2", "3"];
// var bannerImage = [
//   "assets/imagens/av_f.jpg",
//   "assets/imagens/av_f.jpg",
//   "assets/imagens/av_f.jpg"
// ];

// class Banner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;

//     PageController controller = PageController(initialPage: 1);

//     for (int x = 0; x < bannerItems.length;i++){
//       var bannerView = Container(
//         child: Stack(

//         )
//       )
//     }
//       return Container(
//         //height: screenHeight,
//         width: screenWidth * 9 / 16,
//         child: PageView(
//           controller: controller,
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[],
//         ),
//       );
//   }
// }
