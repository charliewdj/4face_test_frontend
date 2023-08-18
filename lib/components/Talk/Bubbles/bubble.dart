


import 'package:flutter/material.dart';
import 'package:four_face_frontend/class/Instant_member.dart';

class Bubble extends StatelessWidget {
  final String message;
  final DateTime time;
  final InstantMember speaker;
  const Bubble({Key? key, required this.message, required this.time, required this.speaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: ClipOval(
              child: Image.asset('lib/Images/profile.jpg'),
            ),
          ),
          const SizedBox(width: 16.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 233, 233,233),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
