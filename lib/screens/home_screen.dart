import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
   HomeScreenState createState() =>  HomeScreenState();
}

class  HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin {

  late TabController _tabController;
  
List<Map<String, dynamic>> categoryList = [
  {
    'id': 1,
    'name': 'Electronic',
    'products': [
      {
        'id': 1,
        'name': 'Flat Screen',
        'price': 5560,
      },
      {
        'id': 2,
        'name': 'Phone Galaxy Note10',
        'price': 1200,
      }
    ]
  },
  {
    'id': 2,
    'name': 'Fruit',
    'products': [
      {
        'id': 3,
        'name': 'Apple',
        'price': 30,
      },
      {
        'id': 4,
        'name': 'Lemon',
        'price': 12,
      }
    ]
  },
  {
    'id': 3,
    'name': 'Beverage',
    'products': [
      {
        'id': 5,
        'name': 'Prestige',
        'price': 100,
      },
      {
        'id': 6,
        'name': 'Prorade',
        'price': 75,
      }
    ]
  }
];

@override
void initState() {
  super.initState();
  _tabController = TabController(length: categoryList.length, vsync: this);	
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        controller: _tabController,
        tabs: categoryList.map<Tab>((el) => Tab(child: Text(el['name'])) ).toList(),
      ),
    ),
    body: TabBarView(
      controller: _tabController,
      children: categoryList.map<Widget>((el) => 
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: el['products'].map<Widget>((pr) => 
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(pr['name'],
                        style: const TextStyle(fontSize: 22.0),
                      )
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                      style: TextStyle(color: Colors.black),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('${pr['price']} HTG',
                          style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Ajoute nan panye
                          },
                          child: const Icon(Icons.shopping_cart),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black)
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () {
                            // Achte kounya
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: const Text('Achte kounya'),
                        ),
                      ],
                    ),
                  ]
                ),
              ),
            ).toList(),
          )
        ),
      ).toList(),
    )
  );
}
}