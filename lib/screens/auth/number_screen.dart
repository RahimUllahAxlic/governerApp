import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/utils/colors.dart';
import 'auth_controller.dart';
import 'login_screen.dart';

class NumberScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      child: Image.asset("images/logo.jpeg")),
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  const Text(
                    "Login To Your Account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: appcolor.maincolor),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: Get.height / 12,
                  ),
                  Center(
                    child: TextFormField(
                      controller: controller.signin_text,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: "Number",
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
                  const SizedBox(
                    height: 38,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              "Use Email For Login",
                              style: TextStyle(color: Colors.black45),
                            ))
                      ],
                    ),
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
