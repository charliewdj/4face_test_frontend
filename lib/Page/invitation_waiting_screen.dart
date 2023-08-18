


import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/profile_edit_screen.dart';
import 'package:four_face_frontend/Page/user_information_screen.dart';

class InvitationWaitingScreen extends StatefulWidget {
  const InvitationWaitingScreen({Key? key}) : super(key: key);

  @override
  State<InvitationWaitingScreen> createState() => _InvitationWaitingScreen();
}

class _InvitationWaitingScreen extends State<InvitationWaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Text('ゆうさん', style: TextStyle(color: Colors.black),)

          ],
        ),
      ),
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text('ゆうさんとマッチしました', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22 ),),

                  SizedBox(height: 8),

                  Text('6日前'),

                  SizedBox(height: 8,),

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
                  ),   //Profile Pictures Photo Circle
                ],
              ),
            ),
          ),
          
          Text('友達を招待しよう'),

          SizedBox(height: 16,),

          Grid(),
        ],
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
        return GestureDetector(
          onTap: (() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UserInformationScreen(),
            ),
          )),
          child: Container(
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
          ),
        );
      },
    );
  }
}
