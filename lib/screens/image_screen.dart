import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sitadèl")),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/sitadel.jpg",
            ),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}