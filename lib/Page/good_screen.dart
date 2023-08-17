

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GoodScreen extends StatelessWidget {

  const GoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Grid(),
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
        );
      },
    );
  }
}