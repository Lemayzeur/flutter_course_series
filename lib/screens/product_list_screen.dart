import 'package:flutter/material.dart';
import 'package:kwiz_app/services/api.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({ Key? key }) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List productList = [];

  bool loading = false;

  @override
  void initState(){
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() {
      loading = true;
    });
    var response = await APIService.get("https://fakestoreapi.com/products");
    if(response.isNotEmpty) {
      setState(() {
        productList = response;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: RefreshIndicator(
        onRefresh: fetchProducts,
        child: Container(
          child:  loading ? const Center(
            child: CircularProgressIndicator()
            )
            : 
            ListView.builder(
            itemCount: productList.length,
            itemBuilder: (ctx, idx) {
              return ListTile(
                leading: Image.network(productList[idx]['image']),
                title: Text(productList[idx]['title']),
                trailing: Text("\$ ${productList[idx]['price']}"),
              );
            }
          )
        ),
      ),
    );
  }
}