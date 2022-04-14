import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  bool licenceAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konekte")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: emailInput,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.purple,
                ),
                decoration: const InputDecoration(
                  hintText: "Imel / Non itilizatè"
                ),
              ),
              TextFormField(
                controller: passwordInput,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.purple,
                ),
                decoration: const InputDecoration(
                  hintText: "Modpas"
                ),
              ),
              Checkbox(
                value: licenceAccepted,
                onChanged: (value){
                  if(value != null){
                    setState((){
                      licenceAccepted = value;
                    });
                  }
                },
                checkColor: Colors.purple,
              ),
            ],
          ),
        )
      )
    );
  }
}