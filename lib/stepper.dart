import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStep = 0;
  String containerContent2 = 'في الطريق إلى موقع الاستلام';
  String containerContent = 'في الطريق إلى موقع الاستلام';

  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1;
        if (currentStep == 0) {
          containerContent2;
          containerContent = 'تم استلام الطلب';
        } else if (currentStep == 1) {
          containerContent2;
          containerContent = 'تم التحرك لتوصيل الطلب ';
        } else {
          containerContent2;
          containerContent = 'تم التسليم بنجاح!';
        }
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1490730141103-6cac27aaab94?auto=format&fit=crop&q=80&w=1170&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                ),
                Container(
                  width: 70,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)),
                  child: const Center(child: Text("12:30")),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Text(containerContent2),
          Text(containerContent),
          Row(
            children: [
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text('Next'),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: details.onStepCancel,
                child: const Text('Back'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stepper(
          stepIconBuilder: (stepIndex, stepState) {
            IconData iconData;
            switch (stepIndex) {
              case 0:
                iconData = Icons.check_circle;
                break;
              case 1:
                iconData = Icons.directions_car;
                break;
              case 2:
                iconData = Icons.delivery_dining;
                break;
              default:
                iconData = Icons.error;
                break;
            }
            return Icon(iconData, color: Colors.white);
          },

          elevation: 0,
          controlsBuilder: controlBuilders,
          type: StepperType.vertical,
          physics: const ScrollPhysics(),
          onStepTapped: onStepTapped,
          onStepContinue: continueStep,
          onStepCancel: cancelStep,
          currentStep: currentStep, //0, 1, 2
          steps: [
            Step(
                title: const Text(''),
                content: const Column(
                  children: [
                    Text(''),
                  ],
                ),
                isActive: currentStep >= 0,
                state:
                    currentStep >= 0 ? StepState.complete : StepState.disabled),
            Step(
              title: const Text(''),
              content: const Text(''),
              isActive: currentStep >= 1,
              state: currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text(''),
              content: const Text(''),
              isActive: currentStep >= 2,
              state: currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
