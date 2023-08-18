


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/four_face_match_screen.dart';
import 'package:four_face_frontend/Page/good_screen.dart';
import 'package:four_face_frontend/Page/home_screen.dart';
import 'package:four_face_frontend/Page/register_screen.dart';

class MatchScreen extends StatelessWidget {

  const MatchScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: 
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'lib/Images/4face.png',
                  width: 73,
                  height: 24,
                ),
              ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Text(
                'マッチング',
              ),
              Text(
                'リクエスト',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16 ,8),
                    child: Text('新規マッチング', style: TextStyle(fontWeight : FontWeight.bold,),),
                  ),
                  SizedBox(
                      width: 358,
                      height: 126,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context , index){
                            return GestureDetector(
                              onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  GoodScreen(),
                                ),
                              )),
                              child: Container(
                                height: 104,
                                width: 80,
                                margin: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                  top: 8,
                                  bottom: 8,
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10
                                    ),

                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://shorturl.at/zBK38'),
                                    )
                                ),
                                child: IconBox()          //good icon box
                              ),

                            );
                          }
                      ),
                    ),
                  ChatBox()
                ],
              ),
            ),

            ListView(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              children: [

                //ActiveChats(),
                Request(),
              ],),

          ],
        ),
      ),
    );
  }
}






class IconBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 4, right: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.
                            circular(
                                10
                            ),
                            color: Colors.pinkAccent,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: SizedBox(
                            width: 24,
                            height: 10,
                            child: Row(
                              children: [
                                Icon(Icons.thumb_up, color: Colors.white, size: 10,),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Text('NEW'))
                          ],
                        )
                      ],
                    )
                  //],
                ),
              )
          //)
        ],
      ),
    );
  }
}

class ChatBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'トークを待ち',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          //ActiveChats(),
          RecentChat(),
        ],),
    );
  }
}

class ActiveChats extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 25, left: 5),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < 10; i++)
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0,3),
                        )
                      ]
                    ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                            'images/profile.jpg',
                        ),
                      ),
                  )
              )
            ],
          ),
        )
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
              onTap: (){},
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


class Request extends StatelessWidget {

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
                  onTap: (){},
                  child: Container(
                    height: 65,
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image.asset(
                          'lib/Images/profile.jpg',
                          fit: BoxFit.fill,
                          height: 65,
                          width: 65,),
                      ),
                      Flexible(
                        child: Padding(
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
                                  overflow: TextOverflow.ellipsis,
                              ),

                              SizedBox(height: 4,),

                              Text("Doraemon の友達の承認待ちです。",
                                style: TextStyle(
                                  fontSize: 12,
                                ),)
                            ],
                          ),
                        ),
                      ),
                      //Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(
                                  //   "12:10",
                                  //   style: TextStyle(fontSize: 15),
                                  // ),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => FourFaceMatchScreen()),
                                          );
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 40,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color(0xff151B04),
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                          child: Text(
                                            "参加",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        height: 30 ,
                                        width: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(25),

                                        ),
                                        child: Text(
                                          "拒否",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ),
                                    ],
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











