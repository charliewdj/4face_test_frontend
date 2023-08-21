


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/find_friends_result.dart';

class FindFriendsScreen extends StatelessWidget {
  const FindFriendsScreen({Key? key}) : super(key: key);

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
                  TextFormField(
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.multiline,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'IDを入力',
                    ),
                  ),

                  SizedBox(height: 300,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindFriendsScreen2()),
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
                              Text('友達を探す', style: TextStyle(fontSize: 12),),
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
