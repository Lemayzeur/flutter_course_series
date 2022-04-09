import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Kwiz App',
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key }) : super(key: key);
  void fonksyonMwen(){

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
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
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const HelpScreen(fromPage: "Paj HomeScreen")));
                }
              ),
            ]
          ),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: const Text('FAB'),
        onPressed: () {
          print("Ou tape FAB la");
        },
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  final String fromPage;
  const HelpScreen({ Key? key,  required this.fromPage }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seksyon èd")
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text("Retounen nan $fromPage")
        )
      ),
    );
  }
}
