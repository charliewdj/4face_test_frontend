

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ChangeNotifierProvider userProvider = ChangeNotifierProvider<User>(
        (ref) => User());

String globalJwt = "";
String globalID = "";
String globalGender = "";

class User extends ChangeNotifier{
  User();

    var ID;
    var name;
    var gender;
    var birthday;
    var jwt;

    void changeUserData(String? id,
        String? name,
        String? gender,
        String? birthday,
        String? jwt){
      if(id != null){
        this.ID = id;
        globalID = id;
      }
      if(name != null){
        this.name = name;
      }
      if(gender != null){
        this.gender = gender;
        globalGender = gender;
      }
      if(birthday != null){
        this.birthday = birthday;
      }
      if(jwt != null){
        this.jwt = jwt;
        globalJwt = jwt;
      }
      notifyListeners();
    }

    void init({required ID,
      required name,
      required gender,
      required birthday,
      required jwt}){
      this.ID = ID;
      this.name = name;
      this.gender = gender;
      this.birthday = birthday;
      this.jwt = jwt;
      notifyListeners();
    }

}