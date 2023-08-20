
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_face_frontend/Page/invitation_waiting_screen.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/repository/search.dart';


class SearchScreen extends ConsumerWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          return SearchScreen();
        });
  }


  Widget build(BuildContext context,WidgetRef ref) {
    SearchNotifier searchNotifier = ref.watch(searchProvider) as SearchNotifier;
    final showing = searchNotifier.showingMember;

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

            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(150, 16, 0, 16),
                child: Icon(Icons.alarm, color: Colors.black,),
              ),
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                child: Icon(Icons.admin_panel_settings, color: Colors.black,),
              ),
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                child: Icon(Icons.visibility, color: Colors.black,),
              ),
            ),


            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                  child: Icon(Icons.offline_bolt, color: Colors.black,),
                ),
              ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                child: Icon(Icons.filter_list, color: Colors.black,),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          UserCard(member: showing),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: FriendsCard(member: showing,),
          )


        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  String image = "";
  String id = "";
  String name = "";
  int age = 0;
  String place = "";

  UserCard({Key? key, required SearchMember? member}) : super(key: key){
    image = member == null ? "" : member!.mainImage!;
    id = member == null ? "" : member!.id!;
    name = member == null ? "" : member!.name!;
    age = member == null ? 0 : member!.age!;
    place = member == null ? "" : member!.place!;
  }

  Widget build(BuildContext context) {
    if(id == ""){
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20
      ),
      child: SizedBox(
        // height: MediaQuery
        //     .of(context)
        //     .size
        //     .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [
            Container(
              width: 680,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                           image!
                      )
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(3, 3),
                    ),
                  ]
              ),
            ),
            Container(
              width: 680,
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(name,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                  ),
                ),
                Text('${age}・${place}',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                  ),
                ),
              ],),
            ),  //ユーザーの名前と年齢・出身地

            Positioned(
              bottom: 20,
              left: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                      children: [
                        Image.asset('lib/Images/ecd.png'),

                        Positioned(
                          bottom: 15,
                          left: 16,
                            child: Image.asset('lib/Images/td.png')
                        ),
                      ]
                  ),  //dislike button

                  SizedBox(width: 24,),

                  Stack(
                      children: [
                        Image.asset('lib/Images/ecu.png'),

                        Positioned(
                            bottom: 17,
                            left: 18,
                            child: Image.asset('lib/Images/tu.png')
                        ),
                      ]
                  ),  //like button


                ],),
            )
          ],
        ),
      ),
    );
  }
}

class FriendsCard extends StatelessWidget{
  String image = "";
  String id = "";
  String name = "";
  int age = 0;
  String place = "";
  List friends = [];

  FriendsCard({Key? key, required SearchMember? member}) : super(key: key){
    image = member == null ? "" : member!.mainImage!;
    id = member == null ? "" : member!.id!;
    name = member == null ? "" : member!.name!;
    age = member == null ? 0 : member!.age!;
    place = member == null ? "" : member!.place!;
    friends = member == null ? [] : member!.friends!;
  }

  @override
  Widget build(BuildContext context) {
    if(id == ''){
      return Container();
    }

    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text('${name}の友達', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),)
        ),

        SizedBox(height: 12,),


        SizedBox(
          width: 358,
          height: 126,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: friends.length,
              itemBuilder: (context , index){
                return GestureDetector(
                  onTap: (() => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          InvitationWaitingScreen(),
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

                        image: image != null
                            ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('${image}'),
                        )
                            : DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://shorturl.at/inO47'),
                        ),
                    ),
                    //child: IconBox()          //good icon box
                  ),

                );
              }
          ),
        ),
      ],
    );
  }

}

