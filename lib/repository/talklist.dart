import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';
import 'package:four_face_frontend/repository/user.dart';

ChangeNotifierProvider talkListProvider = ChangeNotifierProvider<TalkListsNotifier>((ref) => TalkListsNotifier());

class TalkListsNotifier extends ChangeNotifier{
  TalkListsNotifier(){init();}

  List<TalkForList> talks = [];

  init() async {
    final res = await asyncGet("main/talk/talkList.php", {}, globalJwt);
    if(res == ""){return;}
    final data = await jsonDecode(res) as Map<String,dynamic>;
    data.forEach((key, value) {
      final m1d = value["male1"] as Map<String,dynamic>;
      final m2d = value["male2"] as Map<String,dynamic>;
      final f1d = value["female1"] as Map<String,dynamic>;
      final f2d = value["female2"] as Map<String,dynamic>;
      final newTalk = Talk(
          id: key,
          male1: InstantMember(
            id: m1d["ID"],
            name: m1d["name"],
            age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(m1d["birthday"]*1000)).years,
            place: "",
            mainImage: m1d["mainImage"],
          ),
          male2: InstantMember(
            id: m2d["ID"],
            name: m2d["name"],
            age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(m1d["birthday"]*1000)).years,
            place: "",
            mainImage: m2d["mainImage"],
          ),
          female1: InstantMember(
            id: f1d["ID"],
            name: f1d["name"],
            age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(f1d["birthday"]*1000)).years,
            place: "",
            mainImage: f1d["mainImage"],
          ),
          female2: InstantMember(
            id: f2d["ID"],
            name: f2d["name"],
            age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(f1d["birthday"]*1000)).years,
            place: "",
            mainImage: f2d["mainImage"],
          ),
      );
      final newTalkForList = TalkForList(
          talk: newTalk,
          lastChatterd: value["lastchatterd"] == null ? "" : "新しいトークが始まりました！さっそくメッセージを送ってみましょう！",
          unread: value["unread"],
          isNew: (value["lastchatterd"] == null)
      );
      talks.add(newTalkForList);
      notifyListeners();
    });
  }
  remove(index) async {
    final tgt = talks[index];
    final res = await asyncGet("register/talk/talkRemoval.php", {"ID":tgt.talk.id}, globalJwt);
    final data = await jsonDecode(res) as Map<String,dynamic>;
    if(data["result"] == "failed"){return;}
    talks.removeAt(index);
    notifyListeners();
  }
}

class TalkForList{
  TalkForList({
    required this.talk,
    required this.lastChatterd,
    required this.unread,
    required this.isNew
  });
  final Talk talk;
  final String lastChatterd;
  final int unread;
  final bool isNew;
}

class Talk{
  Talk({
    required this.id,
    required this.male1,
    required this.male2,
    required this.female1,
    required this.female2,
  });
  final String id;
  final InstantMember male1;
  final InstantMember male2;
  final InstantMember female1;
  final InstantMember female2;
}