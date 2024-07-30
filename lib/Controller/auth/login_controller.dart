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
  // @override
  // login() async {
  //   DBQuery dBQuery = DBQuery();
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     myuser = await dBQuery.getUser(
  //         email.text.toString(), password.text.toString());
  //     if (myuser.isNotEmpty) {
  //       statusRequest = StatusRequest.success;
  //       Get.toNamed(AppRoute.home);
  //       myServices.sharedPreferences
  //           .setString("userid", myuser.first.userId.toString());
  //       myServices.sharedPreferences.setString("step", "2");
  //       // update();
  //       // String userid = !;
  //       FirebaseMessaging.instance.subscribeToTopic("users");
  //       FirebaseMessaging.instance
  //           .subscribeToTopic("users${myuser.first.userId}");
  //       update();
  //     } else {
  //       // Get.toNamed(AppRoute.,
  //       //     arguments: {"email": email.text});
  //     }
  //   } else {
  //     Get.defaultDialog(
  //         title: "ُWarning", middleText: "Email Or Password Not Correct");
  //     //statusRequest = StatusRequest.failure;
  //   }
  //   update();
  // }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print(value);
    //   String? token = value;
    // });
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
