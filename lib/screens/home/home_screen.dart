import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/utils/colors.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  bool signd;
  HomeScreen(this.signd, {super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Scaffold(
          appBar: AppBar(
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
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey),
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

                      hint: controller.selectedValue.toString() == ""
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
                                controller.selectedValue.toString(),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                      isExpanded: true,
                      items: controller.items.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (v) {
                        controller.selectedValue = v.toString();
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

                      hint: controller.selectedValue2.toString() == ""
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
                                controller.selectedValue2.toString(),
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                      isExpanded: true,
                      items: controller.items2.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (v) {
                        controller.selectedValue2 = v.toString();
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
                  controller.signupUser();
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
