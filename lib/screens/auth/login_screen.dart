import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/screens/diclaimer/disclaimer.dart';
import 'package:newapp/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      height: Get.height * 0.22,
                      width: Get.width * 0.80,
                      child: Image.asset("images/gbit_logo.jpg")),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Login To Your Account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: appcolor.maincolor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
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
                      maxLength: 11,
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
                    maxLength: 13,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: "CNIC Number",
                      hintText: "5441234567890",
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const DisclaimerPage());
                          },
                          child: const Text(
                            "Disclaimer",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            var url1 =
                                'https://sites.google.com/view/privacy-policy-it-training?usp=sharing';

                            final Uri url = Uri.parse(url1);
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.loginUser();
                    },
                    child: Container(
                      height: 50,
                      width: Get.width * .95,
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
