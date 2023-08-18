


import 'package:flutter/material.dart';

class FourFaceMatchScreen extends StatelessWidget {
  const FourFaceMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          'lib/Images/$index.jpg', // Replace with your image paths
          width: 390, // Each image takes half of the screen width
          height: 356, // Each image takes half of the screen height
          fit: BoxFit.cover,
        );
      },
    );
  }
  }

