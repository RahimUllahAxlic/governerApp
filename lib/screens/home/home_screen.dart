import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/screens/diclaimer/disclaimer.dart';
import 'package:newapp/utils/colors.dart';
import 'package:newapp/utils/helper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
          appBar: AppBar(
            backgroundColor: appcolor.maincolor,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  if (_scaffoldKey.currentState!.hasDrawer) {
                    if (!_scaffoldKey.currentState!.isDrawerOpen) {
                      _scaffoldKey.currentState!.openDrawer();
                    } else {
                      _scaffoldKey.currentState!.closeDrawer();
                    }
                  }
                },
                icon: const Icon(Icons.menu, color: Colors.white)),
            title: Row(
              children: [
                SizedBox(
                  width: Get.width / 5.5,
                ),
                const Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 28,
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(254, 254, 254, 1),
                  ),
                  child: Center(
                    child: SizedBox(
                        height: Get.height * 0.25,
                        width: Get.width * 0.80,
                        child: Image.asset("images/gbit_logo.jpg")),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text('Home'),
                        onTap: () {
                          if (_scaffoldKey.currentState!.hasDrawer) {
                            if (!_scaffoldKey.currentState!.isDrawerOpen) {
                              _scaffoldKey.currentState!.openDrawer();
                            } else {
                              _scaffoldKey.currentState!.closeDrawer();
                            }
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.info),
                        title: const Text('Disclaimer'),
                        onTap: () async {
                          Get.to(() => const DisclaimerPage());
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.mail),
                        title: const Text('Contact Us'),
                        onTap: () async {
                          String email = 'kwaqas40929@domain.com';
                          String title = '';
                          String message = '';
// await launch(mailto:$email?subject=$title&body=$message);
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: email,
                            query: 'subject=$title&body=$message',
                          );

                          var url1 = params.toString();

                          final Uri url = Uri.parse(url1);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        trailing: const Icon(Icons.open_in_new),
                      ),
                    ],
                  ),
                ),
                const Divider(), // Add a Divider for visual separation
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Logout'),
                  onTap: () {
                    // Handle Logout button press
                    controller.logout();
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                SizedBox(
                    height: Get.height * 0.25,
                    width: Get.width * 0.80,
                    child: Image.asset("images/gbit_logo.jpg")),
                Visibility(
                    visible: controller.isMarkedTradeCenter,
                    child: SizedBox(
                      width: Get.width * 0.80,
                      child: const Center(
                        child: Text(
                          "You have already selected your trade and center, do you want to update?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 16),
                  child: Text("Please select you're Desired Trade"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 10, right: 10, bottom: 20),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      //fillColor: appcolor.colortextformrear,
                      filled: true,
                      contentPadding: const EdgeInsets.all(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        //  value: controller.selectShop,

                        hint: controller.selectedTrades.toString() == ""
                            ? const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Please select Trade",
                                  style: TextStyle(),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  controller.selectedTrades.toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                        isExpanded: true,
                        items: controller.trades.map((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (v) {
                          controller.selectedTrades = v.toString();
                          controller.change(null, status: RxStatus.success());
                          controller.refresh();
                        },
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 16),
                  child: Text("Please select you're Nearest Station"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 10, right: 10, bottom: 20),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      //fillColor: appcolor.colortextformrear,
                      filled: true,
                      contentPadding: const EdgeInsets.all(5),
                    ),

                    //child:controller.obx((state) => DropdownButtonHideUnderline(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        //  value: controller.selectShop,

                        hint: controller.selectedCenters.toString() == ""
                            ? const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Please select Station",
                                  style: TextStyle(),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  controller.selectedCenters.toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                        isExpanded: true,
                        items: controller.centers.map((e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (v) {
                          controller.selectedCenters = v.toString();
                          controller.change(null, status: RxStatus.success());
                          controller.refresh();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isMarkedTradeCenter) {
                      showDialogueForUpdateTradeCenter(context, () {
                        Navigator.of(context).pop(false);
                      }, () {
                        Navigator.of(context).pop(true);
                        controller.addfetchTradesCenters();
                      });
                    } else {
                      controller.addfetchTradesCenters();
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: Get.width * .95,
                      decoration: BoxDecoration(
                        color: appcolor.maincolor,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                          child: Text(
                        controller.isMarkedTradeCenter
                            ? "Submit again?"
                            : "Submit",
                        style: const TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
