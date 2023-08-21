
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
    print("initialize start");
    final res = await asyncGet("main/search/search.php", {}, globalJwt);
    final data = await jsonDecode(res) as List<dynamic>;
    print("initialize start");
    bool isFirst = true;
    for (var element in data) {
      final newMember = await getAMember(id: element["ID"]);
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
    print("memberChanged")
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

  Future<SearchMember> getAMember({required String id}) async {
    final res = await asyncGet("classResponce/member.php", {"ID":id}, globalJwt);
    Map<String,dynamic> data = await jsonDecode(res);
    String name = data["name"];
    final bdts = data["birthday"];
    final bd = DateTime.fromMillisecondsSinceEpoch(bdts * 1000);
    int age = AgeCalculator.age(bd).years;
    String place = data["place"];
    String mainImage = data["mainImage"];
    final friendsRaw = data["pair"] as Map<String,dynamic>;
    List<InstantMember> friends = [];
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
    return SearchMember(
        id: id,
        name: name,
        age: age,
        place: place,
        mainImage: mainImage,
        friends: friends
    );
  }
}

class SearchMember{
  SearchMember({
    required this.id,
    required this.name,
    required this.age,
    required this.place,
    required this.mainImage,
    required this.friends
  });

  String? id;
  String? name;
  int? age;
  String? place;
  String? mainImage;
  List<InstantMember> friends = [];


}