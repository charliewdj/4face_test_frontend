import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_face_frontend/repository/memberData.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/matching.dart';

class Grid9 extends ConsumerWidget {

  String id = 'ee';
  final String? image;
  Grid9({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    MemberDataNotifier memberDataNotifier = ref.watch(memberDataProvider(this.id)) as MemberDataNotifier;

    return Scaffold(
      body: Stack(
        children: [
          GridView.builder(
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
                              padding: const EdgeInsets.fromLTRB(86, 8, 200, 75),
                              child: Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(16, 10, 150, 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffACAFA4),
                                    borderRadius: BorderRadius.circular(1000),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Center(
                                      child: Icon(Icons.close, color: Colors.white),
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
          ),

          DraggableScrollableSheet(
              builder: (context, controller) => Container(
                color: Color(0xffFFFFFF),
                child: ListView.builder(
                  controller: controller,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    //final user_info = foods[index];

                    return buildDown();
                  },
                ),
              )
          ),
        ]
      ),
    );
  }
}

Future<void> _pickImageFromGallery() async {
  final picker = ImagePicker();
  XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    // Handle the picked image (e.g., display it or upload it)
    File imageFile = File(pickedImage.path);

    // You can implement the image uploading logic here
    // For example, you can upload the image to a server or display it in an Image widget
  } else {
    // User canceled the image picking
  }
}

Widget buildDown() => ListTile(

  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
  title: Padding(
    padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
    child: Align(
      alignment: Alignment.center,
      child: Row(
        children: [
          const SizedBox(width: 139,),
          Text(
              '推奨しない写真',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
            ),
          const SizedBox(width: 90),
          Icon(Icons.close, color: Colors.black,)
        ],
      ),
    ),
  ),
  subtitle: Padding(
    padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
    child: Column(
      children: [
        Grid(),
        SizedBox(height: 30,),

        GestureDetector(
          onTap: () {
            _pickImageFromGallery();
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xffF2F2F0),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('ライブラリーから選択する', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
            ),
          ),
        ), // ライブラリーから選択する button

        SizedBox(height: 16,),

        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xffF2F2F0),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Text('写真を撮る', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),),
          ),
        ), // 写真を撮る button
      ],
    ),
  ),
);


class Grid extends StatelessWidget {

  List<String> images = [
    'lib/Images/ex1.png',
    'lib/Images/ex2.png',
    'lib/Images/ex3.png',
    'lib/Images/ex4.png',
    'lib/Images/ex5.png',
    'lib/Images/ex6.png',
  ];

  List<String> caption = [
    '暗い',
    '画質が荒い',
    '加工しすぎ',
    '顔が見えない',
    'ドアップしすぎている',
    '異性が映っている',
  ];

  Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        mainAxisExtent: 230,
        childAspectRatio: 5
      ),
      itemCount: images.length,
      itemBuilder: (_,index){
        return Container(
          height: 180,
          width: 275,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                16.0
            ),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.asset(
                      '${images[index]}',
                      height: 180,
                      width: 275,
                      fit: BoxFit.cover,
                    )
                ),
                Text('${caption[index]}', style: TextStyle(color: Color(0xff141a03)),),
              ],
            ),

              Padding(
                padding: const EdgeInsets.fromLTRB(80.7, 8, 8, 68),
                child: Image.asset(
                  'lib/Images/pink_x.png',
                  width: 20,
                  height: 20,
                )
// x button pink
              ), //x button pink
            ]
          ),
        );
      },
    );
  }
}