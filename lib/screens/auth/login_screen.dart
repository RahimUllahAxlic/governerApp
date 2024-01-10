import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/utils/colors.dart';
import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  SizedBox(
                      height: Get.height * 0.2,
                      width: Get.width * 0.80,
                      child: Image.asset("images/logo.png")),
                  SizedBox(
                    height: Get.height / 25,
                  ),
                  const Text(
                    "Login To Your Account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: appcolor.maincolor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height / 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: TextField(
                      controller: controller.phone_text,
                      onChanged: (_) {
                        // if (_.length == 4) {
                        //   controller.phone_text.text += "-";
                        // }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        labelText: "Mobile Number",
                        hintText: "03123456789",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromRGBO(0, 0, 0, 0.3)),
                        prefixIcon:
                            Icon(Icons.phone, color: appcolor.maincolor),
                      ),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  TextFormField(
                    controller: controller.cnic_text,
                    onChanged: (_) {
                      // if (_.length == 5 || _.length == 13) {
                      //   controller.phone_text.text += "-";
                      // }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: "CNIC Number",
                      hintText: "54412-3456789-0",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color.fromRGBO(0, 0, 0, 0.3)),
                      prefixIcon:
                          Icon(Icons.credit_card, color: appcolor.maincolor),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  SizedBox(
                    height: Get.height / 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.loginUser();
                    },
                    child: Container(
                      height: 50,
                      width: 202,
                      decoration: BoxDecoration(
                        color: appcolor.maincolor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
