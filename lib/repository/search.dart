
import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';
import 'package:four_face_frontend/repository/user.dart';

ChangeNotifierProvider searchProvider = ChangeNotifierProvider<SearchNotifier>((ref) =>SearchNotifier());

class SearchNotifier extends ChangeNotifier{
  SearchNotifier(){init();}

  List<SearchMember> members = [];
  SearchMember? showingMember;

  init() async{
    final res = await asyncGet("main/search/search.php", {}, globalJwt);
    final data = await jsonDecode(res) as List<dynamic>;
    bool isFirst = true;
    for (var element in data) {
      final newMember = SearchMember(id: element["ID"]);
      if(isFirst){
        showingMember = newMember;
        notifyListeners();
        isFirst = false;
      }
      members.add(newMember);
      notifyListeners();
    }
  }

  like() async {
    if(showingMember == null){return;}
    final res = await asyncGet("register/like/like.php", {"ID":showingMember!.id!}, globalJwt);
    final data = await jsonDecode(res);
    if(data["result"] == "failed"){return;}
    members.removeAt(0);
    if(members.isEmpty){
      init();
    }else{
      showingMember = members[0];
    }
    notifyListeners();
  }

  disLike() async {
    if(showingMember == null){return;}
    final res = await asyncGet("register/like/dislike.php", {"ID":showingMember!.id!}, globalJwt);
    final data = await jsonDecode(res);
    if(data["result"] == "failed"){return;}
    members.removeAt(0);
    if(members.isEmpty){
      init();
    }else{
      showingMember = members[0];
    }
    notifyListeners();
  }
}

class SearchMember{
  SearchMember({required String id}){
    init(id: id);
  }
  
  String? id;
  String? name;
  int? age;
  String? place;
  String? mainImage;
  List<InstantMember> friends = [];
  
  init({required String id}) async {
    final res = await asyncGet("classResponce/member.php", {"ID":id}, globalJwt);
    Map<String,dynamic> data = await jsonDecode(res);
    this.id = data["ID"];
    name = data["name"];
    final bdts = data["birthday"];
    final bd = DateTime.fromMillisecondsSinceEpoch(bdts * 1000);
    age = AgeCalculator.age(bd).years;
    place = data["place"];
    mainImage = data["mainImage"];
    final friendsRaw = data["pair"] as Map<String,dynamic>;
    friendsRaw.forEach((key, value) {
      final  fr = value as Map<String,dynamic>;
      final newfriend = InstantMember(id: fr["ID"],
          name: fr["name"],
          place: fr["place"],
          age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(fr["birthday"]*1000)).years,
          mainImage: fr["mainImage"]
      );
      friends.add(newfriend);
    });
  }
}