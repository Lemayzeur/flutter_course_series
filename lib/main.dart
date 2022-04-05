import 'package:flutter/material.dart';
    
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  // Widjèt sa se rasin aplikasyon an

  const MyApp({Key? key}) : super(key: key);

  void fonksyonMwen(){
    // retounen anyen
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kwiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(
        appBar: AppBar(
          title: const Text("Kwiz App"),
        ),
        body: Center(
          child: Container(
            color: const Color(0xffdddddd),
            padding: const EdgeInsets.only(left: 10.0),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                ElevatedButton(
                  child: const Text('Demare'),
                  onPressed: fonksyonMwen
                ),
                ElevatedButton(
                  child: const Text('Jwenn èd'),
                  onPressed: () {}
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}