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
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(),
        Center(
          child: Image.asset(
            "images/logo.png",
            scale: 2,
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
