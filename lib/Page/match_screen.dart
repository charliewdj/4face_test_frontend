


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/home_screen.dart';
import 'package:four_face_frontend/Page/register_screen.dart';

class MatchScreen extends StatelessWidget {

  const MatchScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                  Container(
                    child: SizedBox(
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
                                  RegisterScreen(),
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
                                child:  Stack(
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
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 20,
                                      ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
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
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.thumb_up, color: Colors.white,),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      Text(
                                                        '1',
                                                        style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Text('NEW')
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    )
                                  ],
                                ),
                              ),

                            );
                          }
                      ),
                    ),
                  ),
                  Scaffold(
                    drawer: Drawer(),
                    body: ListView(children: [
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(0, 3),
                              )

                            ]
                          ),

                        ),
                      )
                    ],),
                  )
                ],
              ),
            ),

            Container(

            )

          ],
        ),
      ),
    );
  }
}

