import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

class TcpClient with ChangeNotifier {
  TcpClient._(this.targetPort){
  }
  final String targetURL = "52.199.125.54";
  final int targetPort;
  Socket? socket;
  bool isConnect = false;
  String serverResponse = '';
  ChatData? responseChatData;

  Future<void> connect() async {
    try {
      socket = await Socket.connect(targetURL, targetPort);
      //TODO:JWTを初回入力する。
      socket?.write("JWT");
      //TODO:
    } catch (e) {
      throw Exception('connect error!!');
    }
    // connect server
    isConnect = true;
    notifyListeners();

    ChatData createChatData(String str){
      List<String> data = str.split("\t");
      if(data.length != 4){
        throw("invalid chat data style: not enough, or too many parameters was given");
      }
      Mode mode = Mode.chat;

      switch (data[2]){
        case "chat":
          mode = Mode.chat;
          break;
        case "info":
          mode = Mode.info;
          break;
        case "group":
          mode = Mode.group;
          break;
        case "gift":
          mode = Mode.gift;
          break;
        case "like":
          mode = Mode.like;
          break;
        default:
          throw ("invalid chat data style: invalid mode was presented");
      }
      return ChatData(data[0], data[1], mode);
    }

    // listen for responses from the server
    socket?.listen(
      // handle data from the server
          (Uint8List data) {
        serverResponse = String.fromCharCodes(data);
        createChatData(serverResponse);
        notifyListeners();
      },
      // handle errors
      onError: (error) {
        socket?.destroy();
      },
      // handle server ending connection
      onDone: () {
        isConnect = false;
        socket?.destroy();
        notifyListeners();
      },
    );
  }

  Future<void> sendMessage(String userID,String message) async {
    message = message.replaceAll("\t", " ");
    List<String> mes = ["\n",userID,"all","all",message,"0"];
    final content = mes.join("\t");
    socket?.write(message);
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

class ChatData{
  const ChatData(this.speaker,this.content,this.chatMode);
  final String speaker;
  final String content;
  final Mode chatMode;
}

enum Mode{
  chat,
  info,
  group,
  gift,
  like
}