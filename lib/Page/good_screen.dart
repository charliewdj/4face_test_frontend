

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:four_face_frontend/repository/matching.dart';

class GoodScreen extends ConsumerWidget {

  List<Matching> toActMatchList = [];

  GoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    MatchNotifier matchNotifier = ref.watch(matchProvider) as MatchNotifier;
    toActMatchList = matchNotifier == null ? [] : matchNotifier!.toActMatchList!;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  child: Icon(Icons.arrow_back_ios, color: Colors.black,),
                ),
              ),

               Padding(
                   padding: const EdgeInsets.fromLTRB(130, 12, 80, 12),
                  child: Text('Good', style: TextStyle(
                      color: Colors.black
                  ),
                  // ),
                ),
              ),

              //SizedBox(height: 1,),

            ],
          )
      ),
      body: Grid(toActMatchList: toActMatchList,),
    );
  }
}

class Grid extends StatelessWidget {

  final List<Matching> toActMatchList;

  Grid({Key? key, required this.toActMatchList}) : super(key: key);

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
      itemCount: toActMatchList.length,
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
                      '${toActMatchList[index].me.mainImage}',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${toActMatchList[index].me.name}', style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 8.0,),
                    Text('${toActMatchList[index].me.age}歳・${toActMatchList[index].me.place}', style: TextStyle(color: Colors.white),),
              ],),)
            ],
          ),
        );
      },
    );
  }
}