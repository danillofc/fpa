import 'package:calcajeans/login.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:calcajeans/home.dart';

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
        builder: (context) => home(), //será Login, quando tiver pronta
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
