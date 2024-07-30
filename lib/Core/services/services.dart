import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/auth/firebaseService.dart';
import '../../View/Screen/home.dart';
import '../constent/routers.dart';
import 'package:task_managment_users/firebase_options.dart';
class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {

    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  initialServices() async {
    await Get.putAsync(() => MyServices().init());
  }
}
