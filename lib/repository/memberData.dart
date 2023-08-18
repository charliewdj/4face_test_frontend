
import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/functions/http_function.dart';
import 'package:four_face_frontend/main.dart';
import 'package:four_face_frontend/repository/user.dart';

ChangeNotifierProvider memberDataProvider(String id) => ChangeNotifierProvider<MemberDataNotifier>((ref) => MemberDataNotifier(id:id));

class MemberDataNotifier extends ChangeNotifier{
  MemberDataNotifier({required this.id});
  final String id;
  late String name;
  late String jender;
  late int birthday;
  late String place;
  late int tall;
  late String shape;
  late String blood;
  late String birthplace;
  late String bg;
  late String occupation;
  late String kir;
  late String purpose;
  late String hope;
  late String hobby;
  late String alcohol;
  late String smoke;
  late String holiday;
  late String explanation;
  late String mainImage;
  late bool isActive;
  late List<String> subImages;
  List<InstantMember> pairs = [];

  init() async {
    final res = await asyncGet("classResponce/member.php", {"ID":id}, globalJwt);
    final data = await jsonDecode(res);
    print(data);
    name = data["name"] ?? "";
    jender = data["jender"] ?? "";
    birthday = data["birthday"] ?? 0;
    place = data["place"] ?? "";
    tall = data["tall"] ?? "";
    shape = data["shape"] ?? "";
    blood = data["blood"] ?? "";
    birthplace = data["birthplace"] ?? "";
    bg = data["bg"] ?? "";
    occupation = data["occupation"] ?? "";
    kir = data["kir"] ?? "";
    purpose = data["purpose"] ?? "";
    hope = data["hope"] ?? "";
    hobby = data["hobby"] ?? "";
    alcohol = data["alchohol"] ?? "";
    smoke = data["smoke"] ?? "";
    holiday = data["holiday"] ?? "";
    explanation = data["explanation"] ?? "";
    mainImage = data["mainImage"] ?? "";
    isActive = data["lastLogin"]==null ? false : (((data["lastLogin"] as int) + 30 * 24 * 60 * 60) * 1000 > DateTime.timestamp().millisecondsSinceEpoch);
    subImages = data["subImages"] ?? [];
    final pairsR = data["pair"] ?? {};
    final pairsRaw = pairsR as Map<String,dynamic>;
    pairsRaw.forEach((key, value) {
      final newPair = InstantMember(
          id: value["ID"],
          name: value["name"],
          place: value["place"],
          age: AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(value["birthday"]*1000)).years,
          mainImage: value["mainImage"]
      );
      pairs.add(newPair);
    });
  }
  
} 