


import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/class/Instant_member.dart';
import 'package:four_face_frontend/repository/memberData.dart';

class UserInformationScreen extends ConsumerWidget {
  const UserInformationScreen({Key? key,required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MemberDataNotifier memberDataNotifier = ref.watch(memberDataProvider(id)) as MemberDataNotifier;
    
    
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
          memberDataNotifier.mainImage,
          fit: BoxFit.cover,
        ),
          DraggableScrollableSheet(
              builder: (context, controller) => Container(
                color: Color(0xffFFFFFF),
                child: ListView.builder(
                  controller: controller,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    //final user_info = foods[index];

                    return buildFood(member: memberDataNotifier);
                  },
                ),
              )
          ),
        ],
      ),
    );
}
}

Widget buildFood({required MemberDataNotifier member}) => ListTile(

  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
  title: Padding(
    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                '${member.name} ${member.birthday == 0 ? AgeCalculator.age(DateTime.fromMillisecondsSinceEpoch(member.birthday * 1000)).years : "--"}歳',
                style: const TextStyle(fontSize: 26),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
              child: Text(member.place)
          ),
        ],
      ),
    ),
  ),
  subtitle: Padding(
    padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
    child: Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
            child: Text('自己紹介', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),)
        ),
        SizedBox(height: 8,),
        Align(
          alignment: Alignment.centerLeft,
            child: Text('ああああああああああああああああああ', style: TextStyle(color: Color(0xffacafa4), fontSize: 14, fontWeight: FontWeight.w400),)
        ),
        SizedBox(height: 30,),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xffB5E825),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text('誘う', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
          ),
        ),
      ],
    ),
  ),
);

