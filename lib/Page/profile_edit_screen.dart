

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  ProfileEditScreenState createState() => ProfileEditScreenState();
}

class ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(51, 16, 51, 16),
              child: Text('プロファイルを編集', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  decoration: BoxDecoration(
                    color: Color(0xffACAFA4),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child:
                        Text('保存', style: TextStyle(fontSize: 12),),
                ),
              ),
              ),              ///////保存 button
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          TextFormField(
          textAlign: TextAlign.left,
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.multiline,
          maxLines: 2,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: '名前',
          ),
        ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '自己紹介',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '趣味',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '身長',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '体型',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '血液型',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '移住地',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '出身地',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '学歴',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: '職業',
            ),
          ),
          TextFormField(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: 'アプリを始めた目的',
            ),
          ),
        ],
      ),
    );
  }
}