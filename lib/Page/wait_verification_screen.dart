
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/repository/matching.dart';

class WaitVerificationScreen extends ConsumerWidget {
  List<Matching> actedMatchList = [];
  final Matching toActedMatchList;
  WaitVerificationScreen({Key? key, required this.toActedMatchList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    MatchNotifier matchNotifier = ref.watch(matchProvider) as MatchNotifier;

    actedMatchList = matchNotifier == null ? [] : matchNotifier!.actedMatchList!;



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
            ListView.builder(
              itemCount: actedMatchList.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  '${actedMatchList[index].me.name}, ${actedMatchList[index].oppo.name}',
                  style: TextStyle(color: Colors.black),
                );
              },
            )
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
                  Text('${toActedMatchList.oppo.name}さんとマッチしました', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22 ),),

                  SizedBox(height: 8),

                  Text('6日前'),

                  SizedBox(height: 8,),

                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ProfileEditScreen()),
                        // );
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage('${toActedMatchList.oppo.mainImage}'), // Replace with your image path
                            fit: BoxFit.cover, // Adjust the fit mode as needed
                          ),
                        ),
                      ),
                    ),
                  ),   //Profile Pictures Photo Circle

                ],
              ),
            ),
          ),


          Container(
            width: 190,
            height: 60,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            decoration: BoxDecoration(
              color: Color(0xffF2F2F0),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Column(
                children: [
                  Text('2023/01/02'),
                  Text(
                    'ハルカを招待しました', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 330),

          Container(
            width: 390,
            height: 138,
            color: Color(0xffE9F8BE),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 22, 40),
              child: Column(
                children: [
                  Text('ハルカの承認待ちです', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  SizedBox(height: 16,),
                  Text('4友だち揃えばトークすることができます。', style: TextStyle(fontSize: 12),),
                  Text('もうしばらくお待ちください。', style: TextStyle(fontSize: 12),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//class _WaitingVerificationScreen extends State<WaitVerificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Row(
//           children: [
//             Text('マミ、ケンジ、ハルカ', style: TextStyle(color: Colors.black),)
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24),
//               child: Column(
//                 children: [
//                   Text('ケンジさんとマッチしました', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22 ),),
//
//                   SizedBox(height: 8),
//
//                   Text('6日前'),
//
//                   SizedBox(height: 8,),
//
//                   Align(
//                     alignment: Alignment.center,
//                     child: GestureDetector(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => ProfileEditScreen()),
//                         // );
//                       },
//                       child: Container(
//                         height: 120,
//                         width: 120,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ),   //Profile Pictures Photo Circle
//
//                 ],
//               ),
//             ),
//           ),
//
//
//             Container(
//               width: 190,
//               height: 60,
//               padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
//               decoration: BoxDecoration(
//                 color: Color(0xffF2F2F0),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Text('2023/01/02'),
//                     Text(
//                       'ハルカを招待しました', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//           const SizedBox(height: 330),
//
//           Container(
//             width: 390,
//             height: 138,
//             color: Color(0xffE9F8BE),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(16, 24, 22, 40),
//               child: Column(
//                   children: [
//                     Text('ハルカの承認待ちです', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
//                     SizedBox(height: 16,),
//                     Text('4友だち揃えばトークすることができます。', style: TextStyle(fontSize: 12),),
//                     Text('もうしばらくお待ちください。', style: TextStyle(fontSize: 12),)
//                   ],
//                 ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
