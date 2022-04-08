import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key }) : super(key: key);

  void fonksyonMwen(){

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Kwiz App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kwiz App')
        ),
        body: Center(
          child: Container(
            color: const Color(0xffdddddd),
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                ElevatedButton(
                  child: const Text('Demare'),
                  onPressed: fonksyonMwen
                ),
                ElevatedButton(
                  child: const Text('Jwenn èd'),
                  onPressed: fonksyonMwen
                ),
              ]
            ),
          )
        )
      ),
    );
  }
}