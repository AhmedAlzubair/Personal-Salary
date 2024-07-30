//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Core/class/statusrequest.dart';
import '../../Core/constent/routers.dart';
import '../../Core/services/services.dart';
import '../../data/dBQuery.dart';
import '../../model/userModel.dart';
import 'firebaseService.dart';

abstract class LoginController extends GetxController {
 // login();
  goToSignUp();
}

class LoginControllerImp extends LoginController {
  List<Users> myuser = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isshowpassword = true;
  // late Users user;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  setStatusRequest(StatusRequest statusReq) {
    statusRequest = statusReq;
    update();
  }

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }
 forgetpassword(){
   FirebaseService.forgetPassword();
 }
  loginAccount() {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      FirebaseService.loginAccount();
    }
  }


  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
 
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
