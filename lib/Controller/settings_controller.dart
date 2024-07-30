import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../Core/constent/routers.dart';
import '../Core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("TOKEN")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.onBoarding);
  }
}