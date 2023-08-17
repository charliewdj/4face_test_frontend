


import 'package:flutter/material.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
          'https://shorturl.at/aBJX7',
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

                    return buildFood();
                  },
                ),
              )
          ),
        ],
      ),
    );
}
}

Widget buildFood() => ListTile(
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
                'Minami 22際',
                style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(height: 8,),
          Align(
            alignment: Alignment.centerLeft,
              child: Text('東京都')
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

