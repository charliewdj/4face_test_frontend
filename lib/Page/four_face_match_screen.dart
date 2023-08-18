


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/home_screen.dart';

class FourFaceMatchScreen extends StatelessWidget {
  const FourFaceMatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [

        Positioned.fill(
          child: Image.asset(
            'lib/Images/1.jpg',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          width: screenWidth / 2,
          height: screenHeight / 2,
          child: Image.asset(
            'lib/Images/2.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: screenWidth / 2,
          height: screenHeight / 2,
          child: Image.asset(
            'lib/Images/3.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: screenWidth / 2,
          height: screenHeight / 2,
          child: Image.asset(
            'lib/Images/4.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(98, 100, 97.2, 200),
          child: Image.asset('lib/Images/4faces.png', width: 194, height: 64,),
        ),   //4face Logo

        Positioned(
          bottom: 120, // Adjust the distance from the bottom as needed
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffB5E825), // Set the background color of the button
                  onPrimary: Colors.black, // Set the text color of the button
                  padding: EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100), // Adjust the border radius
                  ),
                ),
                child: Container(
                  width: 294, // Set the width of the button
                  height: 21, // Set the height of the button
                  alignment: Alignment.center,
                  child: Text(
                      'トークへ移動する',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                ),
              ),
            )

          ),
        ),

        Positioned(
          bottom: 70, // Adjust the distance from the bottom as needed
          left: 0,
          right: 0,
          child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, // Set the background color of the button
                    onPrimary: Colors.white, // Set the text color of the button
                    padding: EdgeInsets.symmetric(horizontal: 20), // Adjust the horizontal padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100), // Adjust the border radius
                    ),
                  ),
                  child: Container(
                    width: 42, // Set the width of the button
                    height: 21, // Set the height of the button
                    alignment: Alignment.center,
                    child: Text(
                      '閉じる',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              )

          ),
        ),

      ],
    );
  }
}

