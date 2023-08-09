import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/good_screen.dart';
import 'package:four_face_frontend/Page/home_screen.dart';
import 'package:four_face_frontend/Page/match_screen.dart';
import 'package:four_face_frontend/Page/register_screen.dart';

import 'Page/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      );
  }
}


