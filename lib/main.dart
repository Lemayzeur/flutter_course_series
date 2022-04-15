import 'package:flutter/material.dart';
import 'package:kwiz_app/screens/home_screen.dart';
import 'package:kwiz_app/screens/image_screen.dart';
import 'package:kwiz_app/screens/login_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ECom App',
      home: HomeScreen()
    );
  }
}