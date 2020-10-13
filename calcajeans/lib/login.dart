import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Telalogin extends StatefulWidget {
  @override
  _TelaloginState createState() => _TelaloginState();
}

class _TelaloginState extends State<Telalogin> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  signUp() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseUser _user = (await _auth.createUserWithEmailAndPassword(
              email: emailEditingController.text,
              password: passwordEditingController.text))
          .user;

      if (_user != null) {
        showMyDialog();
        Timer(Duration(milliseconds: 3000), () {
          Navigator.of(context).pop();
          setState(() {
            isLoading = false;
          });
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => home(),
          ));
        });
      }
    }
  }

  showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // (false - usuario deve pressioanr botão)
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          elevation: 20,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Obrigado!!",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pink",
                  color: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(
            fontSize: 30.0,
            fontFamily: 'Pink',
          ),
        ),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: emailEditingController,
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                            ? null
                            : "Informe o email";
                      },
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordEditingController,
                      validator: (val) {
                        return val.length < 6
                            ? "Informe uma senha com no mínimo 6 caracteres"
                            : null;
                      },
                      decoration: InputDecoration(labelText: "Senha"),
                    ),
                    SizedBox(height: 15),
                    RaisedButton(
                      onPressed: () {
                        signUp();
                      },
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Pink',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
