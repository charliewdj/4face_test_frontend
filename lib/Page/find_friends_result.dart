


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/Page/find_friends_regisered.dart';
import 'package:four_face_frontend/Page/find_friends_screen.dart';
import 'package:four_face_frontend/repository/memberData.dart';

class FindFriendsResult extends ConsumerWidget {

  String id = '';
  String name = '';
  String imageUrl = '';
  int age = 0;
  String place = '';
  FindFriendsResult({Key? key, required String? id}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    MemberDataNotifier memberDataNotifier = ref.watch(memberDataProvider(id)) as MemberDataNotifier;

    id = memberDataNotifier.id == null ? '' : memberDataNotifier.id;
    name = memberDataNotifier.name == null ? '' : memberDataNotifier.name;
    imageUrl = memberDataNotifier.mainImage == null ? '' : memberDataNotifier!.mainImage!;
    age = memberDataNotifier.age == null ? 0 : memberDataNotifier!.age!;
    place = memberDataNotifier.place == null ? '' : memberDataNotifier!.place!;

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
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '${name}',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('ID: ${id}'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('${age}際・${place}'),
                    ],
                  ),
                  SizedBox(height: 30,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindFriendsRegistered()),
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
                            Text('友達申請する', style: TextStyle(fontSize: 12),),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16,),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FindFriendsScreen()),
                      );
                    },
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
