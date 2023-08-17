
import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/Page/search_screen.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';

ChangeNotifierProvider searchProvider = ChangeNotifierProvider<SearchNotifier>((ref) =>SearchNotifier());

class SearchNotifier extends ChangeNotifier {
  SearchNotifier();

  var ID;
  var name;
  var age;
  var place;
  var mainImage;
  List<InstantMember> friends = [];

  init({required String ID,required String jwt}) async {
    final res = await asyncGet("classResponce/member.php", {"ID":ID}, jwt);
    Map<String,dynamic> data = await jsonDecode(res);
    this.ID = data["ID"];
    name = data["name"];
    final bdts = data["birthday"];
    final bd = DateTime.fromMillisecondsSinceEpoch(bdts * 1000);
    age = AgeCalculator.age(bd).years;
    place = data["place"];
    mainImage = data["mainImage"];
    final frendsRaw = data["pair"] as Map<String,dynamic>;
    frendsRaw.forEach((key, value) {
      final  fr = value as Map<String,dynamic>;
      final newfriend = InstantMember(id: fr["ID"],
          name: fr["name"],
          place: fr["place"],
          age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(fr["birthday"]*1000)).years,
          mainImage: fr["mainImage"]
      );
      friends.add(newfriend);
    });
    notifyListeners();
  }
}