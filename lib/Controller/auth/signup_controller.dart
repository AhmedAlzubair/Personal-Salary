import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/class/statusrequest.dart';
import '../../Core/constent/routers.dart';
import 'dart:math';

import 'firebaseService.dart';

abstract class SignUpController extends GetxController {
 // signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? type;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
  int? userid;
  // SignupData signupData = SignupData(Get.find());
   bool isshowpassword = true;

  List data = [];
  chooseType(String ty) {
    type = ty;
    update();
  }
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  void createAccount() {
    if (formstate.currentState!.validate()) {
  
      FirebaseService.createAccount();
    }
  }

  

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
