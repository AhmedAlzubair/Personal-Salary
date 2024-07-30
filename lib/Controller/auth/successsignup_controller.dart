
import 'package:get/get.dart';

import '../../Core/constent/routers.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
 // MyServices myServices = Get.find();
  @override
  goToPageLogin() {
     if (userType == "admin") {
           //   Get.offNamed(AppRoute.homeAdmin);
            }
            else{
 Get.offAllNamed(AppRoute.login);
            }
   
  }

  String? userType;
  @override
  void onInit() {
    // TODO: implement onInit
   // userType = myServices.sharedPreferences.getString("userType");
    super.onInit();
  }
}
