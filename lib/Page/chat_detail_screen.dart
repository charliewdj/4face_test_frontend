

import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: Align(
            alignment: Alignment.center,
            child: Icon(Icons.more_horiz, color: Colors.black,)),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_moderator), onPressed: () {  },)
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                      ),
                      color: Color(0xffF2F2F0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Doraemon, Giant, Nobitaのグループができました'),
                    ),
                  ),
                ],
              ),
            ),
            RightTextBox(),
            LeftTextBox(),
            RightTextBox(),
            RightTextBox(),
            TextInputWidget(),
          ]
        ),
      ),
    );
  }
}

class TextInputWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            iconSize: 28,
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.photo_outlined),
            iconSize: 28,
            color: Colors.black,
            onPressed: () {},
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none),
                ),
              )),
          IconButton(
            icon: Icon(Icons.mic, color: Colors.black,),
            iconSize: 28,
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
    );
  }

}

class RightTextBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32.0
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                    color: Color(0xffB5E825),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('こんにちわ'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftTextBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: ClipOval(
              child: Image.asset('lib/Images/profile.jpg'),
            ),
          ),
          const SizedBox(width: 16.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 233, 233,233),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('俺はドラえもんです'),
            ),
          ),
        ],
      ),
    );
  }

}