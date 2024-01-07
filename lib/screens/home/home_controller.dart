import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final signupformKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final name = TextEditingController();
  //final password = TextEditingController();
  final List<String> items = [
    'Programming',
    'Graphic Designing',
    'Digital Marketing',
  ];
  String selectedValue = '';
  String dropdownValue = 'Trade';
  final List<String> items2 = [
    'Buitmes',
    'UOB',
  ];
  String selectedValue2 = '';
  String dropdownValue2 = 'near Station';

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> signupUser() async {
    auth
        .createUserWithEmailAndPassword(
            email: email.text.toString(), password: "password")
        .then((value) {})
        .onError((error, stackTrace) {
      print(error);
    });
  }
}
