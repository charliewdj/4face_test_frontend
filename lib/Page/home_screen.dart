
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_face_frontend/Page/chat_screen.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:four_face_frontend/Page/main_screen.dart';
import 'package:four_face_frontend/Page/match_screen.dart';
import 'package:four_face_frontend/Page/register_screen.dart';
import 'package:four_face_frontend/Page/search_screen.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    //BlocProvider.of<GetSingleUserCubit>(context).getSingleUser(uid: widget.uid);
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (
        Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            hoverColor: Colors.yellow,
            backgroundColor: Colors.black,
            onPressed: () {},
            tooltip: 'increment',
            child: Container(child: Icon(Icons.find_replace)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(60.0),
              )
            ),
          ),
          bottomNavigationBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(
                  Icons.person_search, color: Colors.white),
                  label: "検索",
                  activeIcon: Icon(
                      Icons.person_search, color: Colors.black)
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_add, color: Colors.black),
                  label: "マッチング"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite, color: Colors.black),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble, color: Colors.black), label: "トーク"),
              BottomNavigationBarItem(icon: Icon(
                  Icons.account_circle_outlined, color: Colors.black),
                  label: "マイページ"),
            ],
            onTap: navigationTapped,
          ),
          body: PageView(
            controller: pageController,
            children: [
              SearchScreen(),
              MatchScreen(),
              ChatScreen(),
              RegisterScreen(),
            ],
            onPageChanged: onPageChanged,
          ),
        )
    );
  } //return Center(child: CircularProgressIndicator(),);
}













