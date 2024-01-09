import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapp/screens/home/home_screen.dart';
import 'package:newapp/utils/helper.dart';

import '../../utils/loadingDialog.dart';



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
     String cnic = cnic_text.text;
     String contactNo = phone_text.text;
    Get.dialog(LoadingDialog("Update Status"),barrierDismissible: false);
    if (!contactNo.contains('-') && contactNo.length > 4) {
      contactNo = '${contactNo.substring(0, 4)}-${contactNo.substring(4)}';
    }

     if (!cnic.contains('-')) {
       if (cnic.length >= 5) {
         cnic = '${cnic.substring(0, 5)}-${cnic.substring(5)}';
       }
       if (cnic.length >= 13) {
         cnic = '${cnic.substring(0, 13)}-${cnic.substring(13)}';
       }
     }
     print(cnic);
    // Check if CNIC and contact number exist in Firestore
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('records')
        .where('cnic_no', isEqualTo: cnic)
        .where('contact_no', isEqualTo: contactNo)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      Get.back();
      Get.to(()=> HomeScreen());
    } else {
      Get.back();
showSnackbar(message: "Invalid Cnic or Phone Number");

    }
  }


}