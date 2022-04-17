import 'package:flutter/material.dart';
import 'package:kwiz_app/screens/home_screen.dart';
import 'package:kwiz_app/services/api.dart';
import 'package:kwiz_app/services/secure_storage.dart';

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

  final SecureStorageService _storageService = SecureStorageService();

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
                        submitForm(data);
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

  void submitForm(data) async {
    var response = await APIService.post('https://fakestoreapi.com/auth/login', body: data);
    if(response != null && response['token'] != null){
      _storageService.write('token', response['token']);
      Navigator.push(context, MaterialPageRoute(
        builder: (builder) => HomeScreen()
      ));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Idantifyan yo pa kòrèk"))
      );
    }
  }
}