
import 'package:get/get.dart';

import '../auth/login_screen.dart';



class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    //var login = await storage.read(key:StorageKeys.login);
     Future.delayed(const Duration(seconds: 2)).then((value) {
        // if(login == "1"){
        //   Get.offAll(() => BottomNav());
        // }else{
          Get.offAll(() => LoginScreen());
       // }
    });
  }
}