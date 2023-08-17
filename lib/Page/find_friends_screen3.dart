


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/home_screen.dart';
import 'package:four_face_frontend/Page/profile_screen.dart';

class FindFriendsScreen3 extends StatelessWidget {
  const FindFriendsScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          ),
          title:
          Align(
            alignment: Alignment.center,
            child: Text('友達を探す', style: TextStyle(color: Colors.black),),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Text(
                '友達検索',
              ),
              Text(
                'リクエスト',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(32, 120, 32, 48),
              child: Column(
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ProfileEditScreen()),
                            // );
                          },
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              
                              image: DecorationImage(
                                image: AssetImage('lib/Images/check_circle.png')
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '友達申請を送りました！',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('相手がリクエストを許可すると友だちになります。'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('もうしばらくお待ちください。'),
                    ],
                  ),
                  SizedBox(height: 30,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffB5E825),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text('マイページへ', style: TextStyle(fontSize: 12),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16,),

                  GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => FindFriendsScreen2()),
                    //   );
                    // },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xffF2F2F0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text('もう一度検索する', style: TextStyle(fontSize: 12),),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
