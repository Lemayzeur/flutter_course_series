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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // m retire espas anndan yo.
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Text('Antèt Drawer a'),
            ),
            ListTile(
              title: const Text('Paj èd'),
              onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const HelpScreen(fromPage: "Paj HomeScreen")));
              },
            ),
            ListTile(
              title: const Text('Nouvo paj'),
              onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const GameScreen()));
              },
            ),
          ],
        ),
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
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const GameScreen()));
                }
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
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
              color: Colors.black,
          );
        },
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Index $index")),
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({ Key? key }) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skò w se ${score.toString()}'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Ogmante skò"),
          onPressed: (){
            setState((){ 
              score += 10; 
            });
          }
        )
      )
    );
  }
}