import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapp/screens/home/home_screen.dart';



class AuthController extends GetxController with StateMixin{

  final cnic_text = TextEditingController();
  final phone_text = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool signed= false;

  @override
  Future<void> onInit() async {
    super.onInit();
    // change(null,status: RxStatus.success());
  }

  Future<void> loginUser() async {

      // await auth.signInWithEmailAndPassword(
      //   email: "rahimullah41561@gmail.com",
      //   password: "password").then((value) {
      //     print("ok");
      // }).onError((error, stackTrace) {
      //
      //   debugPrint(error.toString());
      // });

Get.to(()=> HomeScreen(signed));

  }


}