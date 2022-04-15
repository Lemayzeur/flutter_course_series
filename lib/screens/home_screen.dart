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
          'url': 'https://m.media-amazon.com/images/I/61eBzQr2gmL._AC_SL1001_.jpg',
        },
        {
          'id': 2,
          'name': 'Phone Galaxy Note10',
          'price': 1200,
          'url': 'https://www.bhphotovideo.com/images/images1500x1500/samsung_sm_n970uzsaxaa_galaxy_note10_sm_n970u_256gb_1491312.jpg',
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
          'url': 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/766/images/apple-1-1492554961.jpg',
        },
        {
          'id': 4,
          'name': 'Lemon',
          'price': 12,
          'url': 'https://5.imimg.com/data5/JD/FH/MY-26895711/fresh-green-lemon-500x500.jpg',
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
          'url': 'https://res-5.cloudinary.com/tristanmedia/image/private/c_limit,dpr_auto,f_auto,h_600,q_auto,w_600/yyulamrn0blruuietpzg.jpg'
        },
        {
          'id': 6,
          'name': 'Prorade',
          'price': 75,
          'url': 'https://s3.us-east-2.wasabisys.com/needpam-user-files/images/uploads/file-1625363381181.jpg'
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
        SingleChildScrollView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(pr['name'],
                        style: const TextStyle(fontSize: 22.0),
                      )
                    ),
                    Container(
                      height: 120,
                      child: Image.network(
                        pr['url'],
                        loadingBuilder: (context, child, progress){
                          return progress == null ? child : const CircularProgressIndicator();
                        },
                        fit: BoxFit.contain,
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