import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';


class telaflash extends StatefulWidget {
  @override
  _telaflashState createState() => _telaflashState();
}

class _telaflashState extends State<telaflash> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => telalogin(), //será Login, quando tiver pronta
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          "Confecção Jeans",
          style: TextStyle(
            fontSize: 40.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
