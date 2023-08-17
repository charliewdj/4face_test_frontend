// import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//グローバル変数
// String? fourFaceUserJWT;
// String? fourFaceUserID;



String stringUrl = "https://www.4face.net/4face/app/";
String httpResult = "emptyResult";

Future<String> asyncPost(String target,Map<String,String> params,String? jwt) async {
  //アウトプット用
  String res = "";
  //http形成
  Map<String,String> headerOption = {"Content-Type": "application/json;charset=UTF-8"};
  if (jwt!=null) {
    headerOption["4face"] = jwt;
  }
  final String targetUrl = stringUrl + target;
  final Uri url = Uri.parse(targetUrl);
  final body = jsonEncode(params);

  //http通信
  try{
    http.Response response = await http.post(url,headers: headerOption,body: body);
    if(response.statusCode == 200){
      res = response.body;
    }else{
      print(response.body);
      //http status Error handling
      res = "an error occurred. check the exception status";
      throw("status is not stable. status code: ${response.statusCode.toString()}");
    }
  }catch(exception){
    //http error handling
    res = "an error occurred. check the exception status";
    throw("http session error REASON: $exception");
  }
  return  res;
}

Future<String> asyncGet(String target, Map<String,String> params,String? jwt) async{
  //output用
  String res = "";
  Map<String,String> headerOption = {};
  if (jwt!=null) {
    headerOption = {"4face":jwt};
  }
  //http形成
  final binding = [];
  params.forEach((key, value) {
    binding.add("$key=$value");
  });
  final String param = "?${binding.join("&")}";
  final Uri url = Uri.parse(stringUrl+target+param);
  //handling
  try{
    http.Response response = await http.get(url,headers: headerOption);
    if(response.statusCode == 200){
      res = response.body;
    }else{
      res = res = "an error occurred. check the exception status";
      throw("status is not stable. status code: ${response.statusCode.toString()}");
    }
  }catch(exception){
    res = "an error occurred. check the exception status";
    throw("http session error REASON: $exception");
  }
  return res;
}
Future<Uint8List> asyncImageGet(String imagePath,String? jwt) async{
  Map<String,String> params = {"path":imagePath};
  try{
    String H = await asyncGet("sendImage.php", params,jwt);
    Uint8List rawData = base64Decode(H);
    return rawData;
  }catch(e){
    if (kDebugMode) {
      print("ERROR: getting Image from 4face API failed; REASON:$e");
    }
    throw Exception(e);
  }
}
Future<String> asyncImagePost(String target,io.File file,String ID,String? jwt) async {
  String res = "";
  Uri url = Uri.parse(stringUrl+target);
  List<int> imageToByte = file.readAsBytes() as List<int>;
  String base64Encoded = base64Encode(imageToByte);
  Map<String,String> header = {"Content-Type": "application/json"};
  if (jwt!=null) {
    header["4face_app_JWT"] = jwt;
  }
  List<String> body = ["{ID:$ID}","{image:$base64Encoded}"];
  String jsonData = jsonEncode(body);
  try{
    http.Response response = await http.post(url,headers: header,body: jsonData);
    if(response.statusCode == 200){
      res = response.body;
    }else{
      //http status Error handling
      res = "an error occurred. check the exception status";
      throw("status is not stable. status code: ${response.statusCode.toString()}");
    }
  }catch(exception){
    //http error handling
    res = "an error occurred. check the exception status";
    throw("http session error REASON: $exception");
  }
  return res;
}