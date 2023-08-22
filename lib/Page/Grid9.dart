import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/repository/memberData.dart';

import '../repository/matching.dart';

class Grid9 extends ConsumerWidget {

  String id = 'ee';
  final String? image;
  Grid9({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    MemberDataNotifier memberDataNotifier = ref.watch(memberDataProvider(this.id)) as MemberDataNotifier;

    return GridView.builder(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 145,
      ),
      itemCount: 9,
      itemBuilder: (_,index){
        return DottedBorder(
          color: Color(0xffDADBD6),
          child: Container(
            height: 140,
            width: 114,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff2E2E2E),
            ),
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: image != null
                            ? Image.network(
                          '${image}',
                          height: 140,
                          width: 114,
                          fit: BoxFit.cover,
                        )
                            : Padding(
                              padding: const EdgeInsets.fromLTRB(27, 50, 27, 50),
                              child: Text(
                          '写真がありません', // Display this text if imageUrl is null
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffacafa4)
                          ),
                        ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(86, 8, 61, 172),
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                            decoration: BoxDecoration(
                              color: Color(0xffACAFA4),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Center(
                                child: Icon(Icons.close, color: Colors.black),
                              ),
                            ),
                          ),
                        ), // x button
                      ), //x button
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}