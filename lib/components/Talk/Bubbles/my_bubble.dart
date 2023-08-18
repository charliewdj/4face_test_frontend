


import 'package:flutter/material.dart';
import 'package:four_face_frontend/class/Instant_member.dart';

class MyBubble extends StatelessWidget {
  final String message;
  final DateTime time;
  final InstantMember speaker;
  const MyBubble({Key? key, required this.message, required this.time, required this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32.0
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    color: Color(0xffB5E825),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(message),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
