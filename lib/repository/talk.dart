
import 'dart:convert';
import 'dart:ffi';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';
import 'package:four_face_frontend/repository/talklist.dart';
import 'package:four_face_frontend/repository/user.dart';


ChangeNotifierProvider talkProvider({required String ID})=>ChangeNotifierProvider<TalkNotifier>((ref) => TalkNotifier(ID:ID));

class TalkNotifier extends ChangeNotifier{
  TalkNotifier({required String this.ID});
  final String ID;
  int now = (DateTime.timestamp().millisecondsSinceEpoch/1000).ceil();
  late int to = now;
  late int from = now-now%86400;
  List<Cackle> cackles = [];
  // Talk talk;
  
  init() async {
    final res = await asyncGet(
        "classResponce/talk.php",
        {
          "ID":ID,
          "from":(from).toString(),
          "to":(to).toString()
        },
        globalJwt
    );
    final data = await jsonDecode(res) as Map<String,dynamic>;
    final m1d = data["male1"] as Map<String,dynamic>;
    final m2d = data["male2"] as Map<String,dynamic>;
    final f1d = data["female1"] as Map<String,dynamic>;
    final f2d = data["female2"] as Map<String,dynamic>;
    final male1 = InstantMember(
        id: m1d["ID"],
        name: m1d["name"],
        place: m1d["place"],
        age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(m1d["age"]*1000)).years,
        mainImage: m1d["mainImage"]
    );
    final male2 = InstantMember(
        id: m2d["ID"],
        name: m2d["name"],
        place: m2d["place"],
        age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(m2d["age"]*1000)).years,
        mainImage: m2d["mainImage"]
    );
    final female1 = InstantMember(
        id: f1d["ID"],
        name: f1d["name"],
        place: f1d["place"],
        age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(f1d["age"]*1000)).years,
        mainImage: f1d["mainImage"]
    );
    final female2 = InstantMember(
        id: f2d["ID"],
        name: f2d["name"],
        place: f2d["place"],
        age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(f2d["age"]*1000)).years,
        mainImage: f2d["mainImage"]
    );
    final newTalk = Talk(
        id: data["ID"],
        male1: male1, male2: male2, female1: female1, female2: female2);
  }
  
}

class Cackle{
  Cackle({
    required this.speaker,
    required this.content,
    required this.int
  });
  final InstantMember speaker;
  final String content;
  final DateTime int;
}