import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:four_face_frontend/components/my_textfield.dart';


import '../components/my_button.dart';
import '../components/square_tile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              Image.asset(
                'lib/Images/4face.png',
                width: 100,
                height: 100,
              ),

              const SizedBox(height: 50),




              const SizedBox(height: 25),

              // username textfield


              const SizedBox(height: 10),

              // password textfield


              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                iconImagePath: 'lib/Images/apple.png',
                buttonText: "Apple で登録する",
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              MyButton(
                iconImagePath: 'lib/Images/line.png',
                buttonText: "Line で登録する",
                onTap: signUserIn,
              ),

              const SizedBox(height: 20),

              MyButton(

                buttonText: "メールアドレスで登録する",
                onTap: signUserIn,
              ),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '続けることにより、あなたは利用規約に同意し、'
                            'プライバジーポリシーに同意した上で4face'
                            'による個人データの取り扱いに同意したものとみなされます。',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'すでに登録済みの方はこちら',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                ],
              ),

              // google + apple sign in buttons
              MyButton(

                buttonText: "ログインする",
                onTap: signUserIn,
              ),

              const SizedBox(height: 50),


            ],
          ),
        ),
      ),
    );
  }
}