

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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 174, 12),
                child: Icon(Icons.arrow_back_ios, color: Colors.black,),
              ),

              Padding(
                    padding: const EdgeInsets.fromLTRB(0, 12, 80, 12),
                    child: Text('Good', style: TextStyle(
                      color: Colors.black
                    ),),
                  ),

              SizedBox(height: 32,),
              MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics
                ( ),
                crossAxisCount: 2,
                itemCount: 5,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20
                ),
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            child: ClipRect(

                            ),
                      )
                    ],
                  )
                    ],
                  );
                },
              ),
            ],
          )
      ),
    );
  }

}