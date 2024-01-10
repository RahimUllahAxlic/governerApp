import 'package:get/get.dart';
import 'package:newapp/models/local_user.dart';
import 'package:newapp/screens/home/home_screen.dart';
import 'package:newapp/utils/helper.dart';

import '../auth/login_screen.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    //var login = await storage.read(key:StorageKeys.login);
    LocalUser? currentUser = (await getUserData());

    Future.delayed(const Duration(seconds: 3)).then((value) {
      // if(login == "1"){
      //   Get.offAll(() => BottomNav());
      // }else{
      Get.offAll(() {
        if (currentUser != null &&
            currentUser.cnicNo != null &&
            currentUser.cnicNo!.isNotEmpty) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      });
      // }
    });
  }
}
