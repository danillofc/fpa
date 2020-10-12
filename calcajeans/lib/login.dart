import 'package:flutter/material.dart';
import 'home.dart';

class telalogin extends StatefulWidget {
  @override
  _telaloginState createState() => _telaloginState();
}

class _telaloginState extends State<telalogin> {

  String _email;
  String _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); //Tirei o 'final'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Pink',
          ),
        ),
      ),
      
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return "Informe o email";
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return "Informe uma senha com no mínimo 6 dígitos";
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: "Senha"),
                obscureText: true,
              ),
              SizedBox(height: 15),
              RaisedButton(
                // onPressed: signin(email,password).whenComplete(() =>
                //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>home())))
                // ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        home(), //será Login, quando tiver pronta
                  ));
                },
                child: Text("Registrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // }
  // Future<void> signIn() async {
  //   final formState = _formKey.currentState;
  //   if (formState.validate()) {
  //     formState.save();
  //     try {
  //       User usuario = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => home(user: usuario)));
  //     } catch (e) {
  //       print(e.message);
  //     }
  //   }
  // }


