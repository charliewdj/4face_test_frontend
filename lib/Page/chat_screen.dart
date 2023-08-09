

import 'package:flutter/material.dart';

import 'chat_detail_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'lib/Images/4face.png',
            width: 73,
            height: 24,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          children: [

            //ActiveChats(),
            RecentChat(),
          ],),
    );
  }
}

class RecentChat extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (int i=0; i < 10; i++ )
              Padding(padding: EdgeInsets.symmetric(vertical: 15),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(),
                      )
                    );
                  },
                  child: Container(
                    height: 65,
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          'lib/Images/profile.jpg',
                          height: 65,
                          width: 65,),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doraemon, Nobita, Giant",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),

                            SizedBox(height: 4,),

                            Text("Doraemon の友達の承認待ちです。",
                              style: TextStyle(
                                fontSize: 12,
                              ),)
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "12:10",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 23,
                                    width: 23,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF113953),
                                      borderRadius: BorderRadius.circular(25),

                                    ),
                                    child: Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                    ),
                  ),
                ),
              )
          ],),
      ),
    );
  }
}
