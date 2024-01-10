import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/models/trade_center.dart';
import 'package:newapp/screens/auth/login_screen.dart';
import 'package:newapp/utils/helper.dart';
import 'package:newapp/utils/loadingDialog.dart';

class HomeController extends GetxController with StateMixin {
  final signupformKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  bool isMarkedTradeCenter = false;
  //final password = TextEditingController();
  final List<String> trades = [];
  String selectedTrades = '';
  String dropdownTrades = 'Trade';
  final List<String> centers = [];
  String selectedCenters = '';
  String dropdownCenters = 'near Station';

  final List<String> tradesCenters = [];
  TradeCenter tradesCenter = TradeCenter();

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
    fetchTrades();
    fetchCenters();
    getUserTradeCenterIfAvailable();
  }

  Future<void> fetchCenters() async {
    try {
      CollectionReference<Map<String, dynamic>> centerReference =
          FirebaseFirestore.instance.collection('centers');

      QuerySnapshot<Map<String, dynamic>> centerSnapshot =
          await centerReference.get();

      List<String> centerData =
          centerSnapshot.docs.map((doc) => doc['center'] as String).toList();

      centers.addAll(centerData);
      update();
    } catch (error) {
      print('Error fetching data from Firestore: $error');
    }
  }

  Future<void> fetchTrades() async {
    try {
      CollectionReference<Map<String, dynamic>> tradeReference =
          FirebaseFirestore.instance.collection('trades');

      QuerySnapshot<Map<String, dynamic>> tradeSnapshot =
          await tradeReference.get();

      List<String> tradesData =
          tradeSnapshot.docs.map((doc) => doc['name'] as String).toList();

      trades.addAll(tradesData);
      update();
    } catch (error) {
      print('Error fetching data from Firestore: $error');
    }
  }

  Future<void> fetchTradesCenters() async {
    try {
      CollectionReference<Map<String, dynamic>> tradesCentersReference =
          FirebaseFirestore.instance.collection('trade_centre_selection');

      QuerySnapshot<Map<String, dynamic>> tradesCentersSnapshot =
          await tradesCentersReference.get();

      List<String> tradesCentersData = tradesCentersSnapshot.docs
          .map((doc) => doc['sample'] as String)
          .toList();

      tradesCenters.addAll(tradesCentersData);
      update();
    } catch (error) {
      print('Error fetching data from Firestore: $error');
    }
  }

  Future<void> addfetchTradesCenters() async {
    try {
      if (selectedCenters.isEmpty || selectedTrades.isEmpty) {
        showSnackbar(
          message: "Please select Center or Trade",
        );
      }
      var t = TradeCenter();
      t.center = selectedCenters;
      t.cnicNo = (await getUserData())!.cnicNo;
      t.trade = selectedTrades;

      Get.dialog(LoadingDialog('Submiting data'), barrierDismissible: false);

      await FirebaseFirestore.instance
          .collection('trade_centre_selection')
          .doc()
          .set(t.toJson());
      Get.back();
      showSnackbar(
          title: 'Success',
          message: 'Successfully submited your data',
          backgroundColor: Colors.green);
      isMarkedTradeCenter = true;
      update();
    } catch (error) {
      print('Error fetching data from Firestore: $error');
    }
  }

  Future<void> logout() async {
    try {
      await logoutUser();
      Get.offAll(LoginScreen());
    } catch (error) {
      print('Error fetching data from Firestore: $error');
    }
  }

  Future<void> getUserTradeCenterIfAvailable() async {
    String cnicNo = (await getUserData())!.cnicNo!;
    if (cnicNo.isEmpty) {
      return;
    }

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('trade_centre_selection')
        .where('cnic_no', isEqualTo: cnicNo)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      isMarkedTradeCenter = true;
      tradesCenter = TradeCenter.fromJson(querySnapshot.docs.first.data());
      selectedCenters = tradesCenter.center!;
      selectedTrades = tradesCenter.trade!;
      update();
    }
  }
}
