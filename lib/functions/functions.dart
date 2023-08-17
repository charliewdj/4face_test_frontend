

import 'package:age_calculator/age_calculator.dart';

String s(String? str){
  if(str == null){
    return "";
    //throw Exception("unwrapError");
  }else{
    return str;
  }
}

int age(int birthday){
  DateTime bd = DateTime.fromMillisecondsSinceEpoch(birthday);
  return AgeCalculator.age(bd).years;
}