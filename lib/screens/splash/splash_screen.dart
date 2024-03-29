import 'package:newapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Center(
              child: Image.asset(
                "images/gbit_logo.jpg",
                scale: 4,
              ),
            ),
            const Text(
              "Developed by Elysian Systems",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
            )
          ],
        ));
  }
}
