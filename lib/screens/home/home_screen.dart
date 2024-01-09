import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/utils/colors.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Scaffold(

          appBar: AppBar(
            backgroundColor: appcolor.maincolor,
            elevation: 0,
            leading: Container(),
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
                color: appcolor.maincolor,
              ),
              child: Center(
                child:  SizedBox(
                    height: Get.height * 0.2,
                    width: Get.width * 0.80,
                    child: Image.asset("images/logo.jpeg")),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      // Handle Home button press
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('About'),
                    onTap: () {

                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mail),
                    title: const Text('Contact Us'),
                    onTap: () {

                    },
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
                // Example: controller.logoutUser();
              },
            ),
          ],
        ),
      ),


      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 20,
              ),
              SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.80,
                  child: Image.asset("images/logo.jpeg")),
              const Padding(
                padding: EdgeInsets.only(top: 80, left: 16),
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
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                 controller.addfetchTradesCenters();
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: 202,
                    decoration: BoxDecoration(
                      color: appcolor.maincolor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Center(
                        child: Text(
                      "Add Data",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
