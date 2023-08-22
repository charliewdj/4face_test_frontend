


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/Page/four_face_match_screen.dart';
import 'package:four_face_frontend/Page/good_screen.dart';
import 'package:four_face_frontend/Page/home_screen.dart';
import 'package:four_face_frontend/Page/invitation_waiting_screen.dart';
import 'package:four_face_frontend/Page/register_screen.dart';
import 'package:four_face_frontend/Page/wait_verification_screen.dart';
import 'package:four_face_frontend/repository/matching.dart';

import '../repository/offers.dart';

class MatchScreen extends ConsumerWidget {

  const MatchScreen({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    MatchNotifier matchNotifier = ref.watch(matchProvider) as MatchNotifier;
    OffersNotifier offersNotifier = ref.watch(offersProvider) as OffersNotifier;
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16 ,8),
                  child: Text('新規マッチング', style: TextStyle(fontWeight : FontWeight.bold,),),
                ),
                ToActMatch(matches: matchNotifier.toActMatchList),
                const Padding(
                  padding: EdgeInsets.only(top: 16,left: 16,bottom: 8),
                  child: Text(
                  "トーク待ち",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF151B04),
                  ),
                  )
                ),
                ChatBox(matches: matchNotifier.actedMatchList),
              ],
            ),
            Request(offers: offersNotifier.offers),
          ],
        ),
      ),
    );
  }
}


class ToActMatch extends StatelessWidget{
  ToActMatch({Key? key, required this.matches}) :  super(key : key);
  final List<Matching> matches;
  List<Widget> statusBoxes = [
    const Status0Icon(),
    const Status1Icon(),
    const Status2Icon()
  ];
  Widget newText(bool isNew)=>((isNew) ? const Text('NEW') : Container());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 126,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: matches.length,
        itemBuilder: (context , index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              height: 104,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (matches[index].status == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoodScreen(),
                          ),
                        );
                      } else if (matches[index].status == 1){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvitationWaitingScreen(id: matches[index].me.id),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WaitVerificationScreen(toActedMatchList: matches[index],),
                          ),
                        );
                      };
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              matches[index].oppo.mainImage
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                  alignment: Alignment.topRight,
                  child: statusBoxes[matches[index].status],

                ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: newText(matches[index].status == 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
              child: Center(
                child: Text(
                  matches[index].oppo.name,
                  style: const TextStyle(

                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF151B04)
                  ),
                ),
              ),
            ),
          ],
        );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
class Status0Icon extends StatelessWidget {
  const Status0Icon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.
          circular(
              10
          ),
          color: Colors.pinkAccent,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: SizedBox(
          width: 24,
          height: 10,
          child: Row(
            children: [
              Icon(Icons.thumb_up, color: Colors.white, size: 10,),
              SizedBox(
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
    );
  }
}
class Status1Icon extends StatelessWidget {
  const Status1Icon({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.
          circular(
              10
          ),
          color: Colors.black,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: const SizedBox(
          width: 24,
          height: 10,
          child: Text(
            "招待待ち",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xFFFFFFFF),
            ),
          )
        ),
      ),
    );
  }
}
class Status2Icon extends StatelessWidget {
  const Status2Icon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.
          circular(
              10
          ),
          color: const Color(0xCDFFFFFF),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: const Text(
          "承認待ち",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: Color(0xFF151B04),
          ),
        ),
      ),
    );
  }
}
class ChatBox extends StatelessWidget {
  const ChatBox({Key? key, required this.matches}) : super(key:key);
  final List<Matching> matches;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'トーク待ち',
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: matches.length,
          itemBuilder: (BuildContext context, int index) {
            return RecentChat(matching: matches[index]);
          },
        ),
      ],
    );
  }
}


// class ActiveChats extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.only(top: 25, left: 5),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//               for (int i = 0; i < 10; i++)
//               Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                   child: Container(
//                     width: 65,
//                     height: 65,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(35),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           blurRadius: 10,
//                           spreadRadius: 2,
//                           offset: Offset(0,3),
//                         )
//                       ]
//                     ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(35),
//                         child: Image.asset(
//                             'images/profile.jpg',
//                         ),
//                       ),
//                   )
//               )
//             ],
//           ),
//         )
//     );
//   }
// }
class RecentChat extends StatelessWidget {
  const RecentChat({Key? key,required this.matching}): super(key:key);
  final Matching matching;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 65,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32.5),
              child: Row(
                children: [
                  Image.network(
                      matching.me.mainImage,
                      width: 32.5
                  ),
                  Image.network(
                    matching.oppo.mainImage,
                    width: 32.5,
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${matching.me.name},${matching.oppo.name}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text("${matching.oppo.name}の友達の承認待ちです。",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFACAFA4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class Request extends StatelessWidget {
  const Request({Key? key, required this.offers}) : super(key: key);
  final List<Offer> offers;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListView.builder(
        itemCount: offers.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(padding: const EdgeInsets.symmetric(vertical: 15),
            child: InkWell(
              onTap: (){},
              child: SizedBox(
                height: 65,
                child: Row(children: [
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(35),
                  //   child: Image.network(
                  //     offers[index].sender.mainImage,
                  //     fit: BoxFit.fill,
                  //     height: 65,
                  //     width: 65,),
                  // ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${offers[index].sender}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                                      child: const Text(
                                        "参加",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  Container(
                                    height: 30 ,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(25),

                                    ),
                                    child: const Text(
                                      "拒否",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
          );
        },

      ),
    );
  }
}











