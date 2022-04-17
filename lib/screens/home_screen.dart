import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kwiz_app/services/api.dart';
import 'package:kwiz_app/services/secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
   HomeScreenState createState() =>  HomeScreenState();
}

class  HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> categoryList = [];
    

  @override
  void initState() {
    super.initState();
    getCartIDs();
    fetchCategories();
  }

  // final secureStorage = const FlutterSecureStorage();
  final SecureStorageService _storageService = SecureStorageService();

  List<int> cart = [];

  void getCartIDs() async {
    var res = await _storageService.read('cart');
    if(res != null){
      setState((){
        cart = json.decode(res).cast<int>();
        // cart = json.decode(res).map<int>((e) => e as int).toList();
      });
    }
  }

  void fetchCategories() async {
    var response = await APIService.get("https://fakestoreapi.com/products/categories");
    if(response != null) {
      setState((){
        categoryList = response.map<Map<String, dynamic>>((el){
          return {"name": el, "products": []};
        }).toList();
        if(categoryList.length > 4){
          categoryList = categoryList.sublist(0, 4);
        }
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryList.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: categoryList.map<Tab>((el) => Tab(child: Text(el['name'])) ).toList(),
          ),
        ),
        body: TabBarView(
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
                                if(cart.contains(pr['id'])){
                                  setState((){
                                    cart.removeWhere((id) => id == pr['id']);
                                  });
                                }else{
                                  setState((){
                                    cart.add(pr['id']);
                                  });
                                }
                                _storageService.write('cart', json.encode(cart));
                              },
                              child: const Icon(Icons.shopping_cart),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(cart.contains(pr['id']) ? Colors.greenAccent : Colors.grey),
                                foregroundColor: MaterialStateProperty.all<Color>(cart.contains(pr['id']) ? Colors.black : Colors.white)
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
      ),
    );
  }
}