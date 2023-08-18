


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/find_friends_screen.dart';
import 'package:four_face_frontend/Page/profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
                'lib/Images/4face.png',
                width: 73,
                height: 24,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(230, 12, 0, 12),
              child: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 12, 0, 12),
                child: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileEditScreen()),
                  );
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
            
            Text('Minami', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22 ),),
            
            SizedBox(height: 8,),
            
            Text('ID: Riku'),
            
            SizedBox(height: 8,),
            
            Text('22際　東京'),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color(0xffACAFA4),
                              borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              children: [

                                Text('ポイント', style: TextStyle(fontSize: 12),),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Image.asset('lib/Images/Group 624527.png'),
                                      Text('5000', style: TextStyle(fontSize: 16, color: Colors.black),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 9,),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color(0xffACAFA4),
                              borderRadius: BorderRadius.circular(8),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                                children: [
                                  Text('ダイヤ', style: TextStyle( fontSize: 12),),
                                  Row(
                                      children: [
                                        Image.asset('lib/Images/diamond.png'),
                                        Text('5000', style: TextStyle(fontSize: 16, color: Colors.black),)
                                      ],
                                    ),
                                ],
                              ),
                          ),

                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 9,),
                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xffACAFA4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text('アイテム', style: TextStyle(fontSize: 12),),
                                Text('1', style: TextStyle(fontSize: 16, color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 9,),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0xffACAFA4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text('全員ステータス', style: TextStyle( fontSize: 12),),
                                Text('無料プラン', style: TextStyle(fontSize: 16, color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('友達', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),)
                    ),

                    SizedBox(width: 200,),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FindFriendsScreen()),
                        );
                      },
                      child: Expanded(
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
                    ),          //友達を探すbutton !!
                  ],
                ),
            ),
            Grid(),
          ],
        ),
      ),
    );
  }
}

class Grid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 300,
      ),
      itemCount: 5,
      itemBuilder: (_,index){
        return Container(
          height: 22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                16.0
            ),
            color: Color(0xff2E2E2E),
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    'https://shorturl.at/fgwH1',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Minami', style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 8.0,),
                    Text('25歳・東京', style: TextStyle(color: Colors.white),),
                  ],),)
            ],
          ),
        );
      },
    );
  }
}
