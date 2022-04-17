import 'package:flutter/material.dart';
import 'package:kwiz_app/screens/home_screen.dart';
import 'package:kwiz_app/screens/login_screen.dart';
import 'package:kwiz_app/services/secure_storage.dart';

String? token;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final  SecureStorageService _storageService = SecureStorageService();
  token = await _storageService.read("token");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'ECom App',
      home: token == null || token!.isEmpty ? LoginScreen() : HomeScreen(),
    );
  }
}