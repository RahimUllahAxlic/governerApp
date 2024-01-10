import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/models/local_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSnackbar(
    {String title = 'Error',
    required String message,
    IconData icon = Icons.error,
    Color backgroundColor = Colors.red}) {
  Get.snackbar(
    title,
    message,
    icon: Icon(icon, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

void setUserData(Map<String, dynamic> map) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString("full_name", map["full_name"].toString());
  sp.setString("father_name", map["father_name"].toString());
  sp.setString("email", map["email"].toString());
  sp.setString("index", map["index"].toString());
  sp.setString("user_id", map["user_id"].toString());
  sp.setString("cnic_no", map["cnic_no"].toString());
  sp.setString("contact_no", map["contact_no"].toString());
  sp.setString("city_id", map["city_id"].toString());
  sp.setString("date_of_birth", map["date_of_birth"].toString());
  sp.setString("gender", map["gender"].toString());
  sp.setString("qualification", map["qualification"].toString());
  sp.setString("address", map["address"].toString());
  sp.setString("registration_no", map["registration_no"].toString());
}

Future<LocalUser?> getUserData() async {
  Map<String, String> map = {};
  try {
    SharedPreferences sp = await SharedPreferences.getInstance();
    map["full_name"] = sp.getString("full_name")!;
    map["father_name"] = sp.getString("father_name")!;
    map["email"] = sp.getString("email")!;
    map["index"] = sp.getString("index")!;
    map["user_id"] = sp.getString("user_id")!;
    map["cnic_no"] = sp.getString("cnic_no")!;
    map["contact_no"] = sp.getString("contact_no")!;
    map["city_id"] = sp.getString("city_id")!;
    map["date_of_birth"] = sp.getString("date_of_birth")!;
    map["gender"] = sp.getString("gender")!;
    map["qualification"] = sp.getString("qualification")!;
    map["address"] = sp.getString("address")!;
    map["registration_no"] = sp.getString("registration_no")!;

    return LocalUser.fromJson(map);
  } catch (e) {
    print(e);
    return null;
  }
}

Future<void> logoutUser() async {
  try {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
  } catch (e) {
    print(e);
  }
}

Future<bool> showDialogueForUpdateTradeCenter(
    BuildContext context, Function() onTapNo, Function() onTapYes) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Update Trade and Center'),
        content: const Text(
            'Do you want to submit trade and center information again?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: onTapNo,
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: onTapYes,
          ),
        ],
      );
    },
  );
}
