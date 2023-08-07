
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SearchScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) {
          return SearchScreen();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'lib/Images/4face.png',
              width: 73,
              height: 24,
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(150, 16, 0, 16),
                child: Icon(Icons.alarm, color: Colors.black,),
              ),
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                child: Icon(Icons.admin_panel_settings, color: Colors.black,),
              ),
            ),

            Align(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                child: Icon(Icons.visibility, color: Colors.black,),
              ),
            ),


            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                  child: Icon(Icons.offline_bolt, color: Colors.black,),
                ),
              ),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 16, 0, 16),
                child: Icon(Icons.filter_list, color: Colors.black,),
              ),
            )
          ],
        ),
      ),
      body: UserCard(),
    );
  }
}

class UserCard extends StatelessWidget {


  const UserCard({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20
      ),
      child: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://shorturl.at/dRVXY'
                      )
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(3, 3),
                    ),
                  ]
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Doraemon',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                      fontSize: 24,
                  ),
                ),
                Text('25歳・東京',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                  ),
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

