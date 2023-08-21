


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/Page/find_friends_result.dart';

import 'package:four_face_frontend/repository/memberData.dart';

class FindFriendsScreen extends StatelessWidget {



  String? inputTextId = '';

  FindFriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // onTapId() {
    //   FindFriendsResult(id: inputTextId);
    //
    // }

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
              padding: const EdgeInsets.fromLTRB(32, 250, 32, 48),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'IDを入力してください';
                    //   }
                    //   return null;
                    // },
                    onSaved: (value) {
                      inputTextId = value!;
                    },
                  ),
                  // SizedBox(height: 16.0),
                  // ElevatedButton(
                  //   onPressed: onTapId,
                  //   child: Text('送信'),
                  // ),

                  SizedBox(height: 300,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindFriendsResult(id: inputTextId)),
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
