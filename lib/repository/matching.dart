
import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';
import 'package:four_face_frontend/repository/user.dart';

ChangeNotifierProvider matchProvider = ChangeNotifierProvider<MatchNotifier>((ref) => MatchNotifier());

class MatchNotifier extends ChangeNotifier{
  MatchNotifier();
  List<Matching> matchList = [];

  init() async {
    final res = await asyncGet("main/match/matchList.php", {}, globalJwt);
    final data = await jsonDecode(res) as List<dynamic>;
    for (var element in data) {
      final id = element["ID"];
      final md = element["male1"];
      final male = InstantMember(
          id: md["ID"],
          name: md["name"],
          place: "",
          age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(md["birthday"]*1000)).years,
          mainImage: md["mainImage"]
      );
      final fd = element["female1"];
      final female = InstantMember(
          id: fd["ID"],
          name: fd["name"],
          place: "",
          age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(fd["birthday"]*1000)).years,
          mainImage: fd["mainImage"]
      );
      final ms = (element["male2"] == null) ? 0 : (element["male2"]["status"] == 1 ? 1 : 2);
      final fs = (element["female2"] == null) ? 0 : (element["female2"]["status"] == 1 ? 1 : 2);
      if(globalGender == "男性"){
        matchList.add(
            Matching(
              id: id,
              me: male,
              oppo: female,
              status: ms * 3 + fs
            )
        );
      }else{
        matchList.add(
            Matching(
                id: id,
                me: female,
                oppo: male,
                status: fs * 3 + ms
            )
        );
      }
      notifyListeners();
    }
  }
  change(index,pairID) async {
    final tgt = matchList[index];
    if(tgt.status > 3){return;}
    final res = await asyncGet("register/match/offerApprication.php", {"pairID":pairID,"matchID":tgt.id}, globalJwt);
    final response = await jsonDecode(res);
    if(response["result"] == "failed"){
      return;
    }
    matchList[index].status += 3;
    notifyListeners();
  }
  remove(index) async {
    final res = await asyncGet("register/talk/talkRemoval.php", {"ID":matchList[index].id}, globalJwt);
    final response = await jsonDecode(res);
    if(response["result"] == "failed"){
      return;
    }
    matchList.remove(matchList[index]);
    notifyListeners();
  }
}
class Matching{
  Matching({
    required this.id,
    required this.me,
    required this.oppo,
    required this.status,
  });
  final String id;
  final InstantMember me;
  final InstantMember oppo;
  int status;
}
