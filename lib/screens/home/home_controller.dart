import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  final signupformKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  //final password = TextEditingController();
  final List<String> trades = [];
  String selectedTrades = '';
  String dropdownTrades = 'Trade';
  final List<String> centers = [];
  String selectedCenters = '';
  String dropdownCenters = 'near Station';
  List _items = [];

  final List<String> tradesCenters = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    change(null, status: RxStatus.success());
fetchTrades();
fetchCenters();
fetchTradesCenters();
  }


  Future<void> fetchCenters() async {
    try {
      CollectionReference<Map<String, dynamic>> centerReference =
      FirebaseFirestore.instance.collection('centers');


      QuerySnapshot<Map<String, dynamic>> centerSnapshot =
      await centerReference.get();

     List<String> centerData = centerSnapshot.docs
          .map((doc) => doc['center'] as String)
          .toList();

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

      List<String> tradesData = tradeSnapshot.docs
          .map((doc) => doc['name'] as String)
          .toList();

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



}
