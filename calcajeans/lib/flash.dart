import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async';


class telaflash extends StatefulWidget {
  @override
  _telaflashState createState() => _telaflashState();
}

class _telaflashState extends State<telaflash> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => home(), 
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          "Calça Jeans",
          style: TextStyle(
            fontSize: 40.0,
            fontFamily: "Pink"
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
