
import 'package:get/get.dart';

import '../../Core/constent/routers.dart';

abstract class SuccessResetPasswordController extends GetxController {

goToPageLogin() ; 

}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
     Get.offAllNamed(AppRoute.login) ; 
  }

}
