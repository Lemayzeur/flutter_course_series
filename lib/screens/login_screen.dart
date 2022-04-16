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
              generateTextField(emailInput, hintText: "Imel / Non itilizatè"),
              generateTextField(passwordInput, hintText: "Modpas", obscureText: true),
              Row(
                children: [
                  Checkbox(
                    value: licenceAccepted,
                    onChanged: (value){
                      if(value != null){
                        setState((){
                          licenceAccepted = value;
                        });
                      }
                    },
                    activeColor: Colors.purple,
                  ),
                  const Text('Tcheke pou w asepte lisans lan')
                ],
              ),
              const SizedBox(height: 15.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Konekte"),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                        // voye done yo ale bay yon API, pa ekzanp.
                        Map data = {"username": emailInput.text, "password": passwordInput.text};
                        print(data);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Fòmilè a pa valid"))
                      );
                    }
                  }
                )
              )
            ],
          ),
        )
      )
    );
  }
  TextFormField generateTextField(controller, {required String hintText, bool obscureText=false}){
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.purple,
      ),
      decoration: InputDecoration(
        hintText: hintText
      ),
      validator: (value){
        if(value ==  null  || value.isEmpty){
          return 'Chan sa obligatwa';
        }
        return null;
      },
    );
  }

}