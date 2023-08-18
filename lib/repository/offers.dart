
import 'dart:convert';
import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';
import 'package:four_face_frontend/repository/user.dart';

class OffersNotifier extends ChangeNotifier{
  OffersNotifier();
  List<Offer> offers = [];

  init() async{
    final res = await asyncGet("main/match/offerList.php", {}, globalJwt);
    if(res == ""){print("no offers");return;}
    final data = await jsonDecode(res) as List<dynamic>;
    for (var element in data) {
      final md = element["sender"] as Map<String,dynamic>;
      final newOffer = Offer(
          talkID: element["matchID"],
          sender: InstantMember(
            id: md["ID"],
            name: md["name"],
            place: "",
            age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(md["birthday"]*1000)).years,
            mainImage: md["mainImage"],
          )
      );
      offers.add(newOffer);
      notifyListeners();
    }
  }
  aplobal(index) async{
    final tgt = offers[index];
    final res = await asyncGet("register/match/offerApproval.php", {"ID":tgt.talkID}, globalJwt);
    final data = await jsonDecode(res);
    if(data["result"] == false){return ;}

    offers.remove(index);
    sleep(const Duration(seconds: 1));
    notifyListeners();
  }
  rejection(index) async{
    final tgt = offers[index];
    final res = await asyncGet("register/match/offerRejection.php", {"ID":tgt.talkID}, globalJwt);
    final data = await jsonDecode(res);
    if(data["result"] == false){return ;}

    offers.remove(index);
    sleep(const Duration(seconds: 1));
    notifyListeners();
  }

}

class Offer{
  Offer({
    required this.talkID,
    required this.sender,
    // required this.oppo
  });
  final String talkID;
  final InstantMember sender;
  // final InstantMember oppo;
}
