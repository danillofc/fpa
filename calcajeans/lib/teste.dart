import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: _body(),
    );
  }

  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Text("Imagem 1"),
          color: Colors.blue,
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(30.0),
          alignment: Alignment.topCenter,
          // width: 200,
        ),
      ],
    );
  }
}

// IMAGEM E TEXTO INFINITO, COM CONTAINER E LISTVIEW
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 3,
//             child: Container(
//               padding: EdgeInsets.all(15.0),
//               alignment: Alignment.bottomLeft,
//               child: ListView(                               Listview com imagem e texto, entro de Container
//                 children: <Widget>[
//                   Image(image: AssetImage(
//                           "assets/imagens/maq.jpg",
//                         ),
//                       ),
//                   Text(
//                     data, //Texto sobre a máquina
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
