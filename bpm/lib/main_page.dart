import 'package:flutter/material.dart';
import 'package:bpm/result_page.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 52, 54, 56),
        title: const Text('Blood Pressure Monitor',
            style: TextStyle(
                color: Color.fromARGB(255, 228, 228, 228),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 340,
                    child: Image.asset(
                      "assets/images/1.png",
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          Icon(Icons.dashboard_customize_sharp,
                              color: Colors.deepPurple, size: 40),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Systolic(controller: systolicController),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Column(
                        children: [
                          Icon(Icons.control_point_duplicate_rounded,
                              color: Color.fromARGB(255, 38, 137, 219),
                              size: 40),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          Diastolic(controller: diastolicController),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 75),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(218, 194, 10, 19),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(15.15),
                          ),
                        ),
                        onPressed: () {
                          if (_validateInput(systolicController.text,
                              diastolicController.text)) {
                            int systolic = int.parse(systolicController.text);
                            int diastolic = int.parse(diastolicController.text);
                            if (systolic == 0 || diastolic == 0) {
                              _showInvalidInputPopup(context);
                            } else if (systolic <= 120 && diastolic <= 80) {
                              Get.to(const ResultPage(result: 's1'));
                            } else if (systolic >= 120 &&
                                systolic <= 129 &&
                                diastolic < 80) {
                              Get.to(const ResultPage(result: 's2'));
                            } else if ((systolic >= 130 && systolic <= 139) &&
                                (diastolic >= 80 && diastolic <= 89)) {
                              Get.to(const ResultPage(result: 's3'));
                            } else if ((systolic < 180 || systolic >= 140) &&
                                (diastolic < 120 && diastolic >= 90)) {
                              Get.to(const ResultPage(result: 's4'));
                            } else if (systolic >= 180 && diastolic >= 120) {
                              Get.to(const ResultPage(result: 's5'));
                            } else {
                              _showInvalidInputPopup(context);
                            }
                          } else {
                            _showInvalidInputPopup(context);
                          }
                        },
                        icon: const Icon(
                          Icons.bloodtype,
                          size: 40,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: const Text(
                          'Show Info',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Text("Created by Tharindu")],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _validateInput(String systolic, String diastolic) {
    // Check if both inputs are valid integers
    if (int.tryParse(systolic) == null || int.tryParse(diastolic) == null) {
      return false;
    }
    return true;
  }

  void _showInvalidInputPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Inputs'),
          content: const Text(
              'Please enter valid blood pressure values for systolic and diastolic pressures.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Systolic extends StatelessWidget {
  final TextEditingController controller;

  const Systolic({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '• Systolic pressure',
        ),
      ),
    );
  }
}

class Diastolic extends StatelessWidget {
  final TextEditingController controller;

  const Diastolic({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '• Diastolic blood pressure',
        ),
      ),
    );
  }
}
