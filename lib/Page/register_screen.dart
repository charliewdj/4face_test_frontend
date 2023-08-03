

import 'package:flutter/material.dart';
import 'package:four_face_frontend/components/my_textfield.dart';



class RegisterScreen extends StatefulWidget {



  RegisterScreen({super.key});



  @override
  State<RegisterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RegisterScreen> {

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  int currentStep = 0;

  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1; //currentStep+=1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1; //currentStep-=1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: details.onStepContinue,
            child: const Text('次へ'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: details.onStepCancel,
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "会員登録",
          style: TextStyle(
            color: Color(0xff151B04), // Replace this with your desired color
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Theme(
        data: ThemeData(
          accentColor: Colors.orange,
          primarySwatch: Colors.orange,
          colorScheme: ColorScheme.light(
              primary: Colors.orange
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 130),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Center(
              child: SizedBox(
                width: 216.0,
                height: 24,

                child: Stepper(
                  elevation: 0,
                  //Horizontal Impact
                  margin: const EdgeInsets.all(1),
                  //vertical impact
                  controlsBuilder: controlBuilders,
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  onStepTapped: onStepTapped,
                  onStepContinue: continueStep,
                  onStepCancel: cancelStep,
                  currentStep: currentStep,
                  //0, 1, 2
                  steps: [
                    Step(
                        title: const Text(''),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
                          child: Column(
                            children: [
                              Text('ニックネーム', style: TextStyle(fontSize: 22)),
                              MyTextField(
                                  controller: usernameController,
                                  hintText: 'Username',
                                  obscureText: false,
                                ),
                            ],
                          ),
                        ),
                        isActive: currentStep >= 0,
                        state:
                        currentStep >= 0 ? StepState.complete : StepState.disabled),
                    Step(
                      title: const Text(''),
                      content: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: const Text('生年月日', style: TextStyle(fontSize: 22)),
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 1 ? StepState.complete : StepState
                          .disabled,
                    ),
                    Step(
                      title: const Text(''),
                      content: const Text('性別', style: TextStyle(fontSize: 22)),
                      isActive: currentStep >= 0,
                      state: currentStep >= 2 ? StepState.complete : StepState
                          .disabled,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}