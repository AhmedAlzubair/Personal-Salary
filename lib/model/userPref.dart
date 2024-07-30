import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/services/services.dart';

class UserPref {
 
  static Future<void> setUser(String name, String email, String password,
      String node, String token) async {
           MyServices myServices = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    myServices.sharedPreferences.setString('NAME', name);
    myServices.sharedPreferences.setString('EMAIL', email);
    myServices.sharedPreferences.setString('PASSWORD', password);
    myServices.sharedPreferences.setString('NODE', node);
    myServices.sharedPreferences.setString('TOKEN', token);
            FirebaseMessaging.instance
            .subscribeToTopic("users${token}");
             FirebaseMessaging.instance.subscribeToTopic("users");
     pref.setString("step", "2");
    print("==============================================${token}");
  }

  static Future<Map<dynamic, dynamic>> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
     MyServices myServices = Get.find();
    return {
      'NAME': myServices.sharedPreferences.getString('NAME')!,
      'EMAIL': myServices.sharedPreferences.getString('EMAIL')!,
      'PASSWORD': myServices.sharedPreferences.getString('PASSWORD')!,
      'NODE': myServices.sharedPreferences.getString('NODE')!,
      'TOKEN': myServices.sharedPreferences.getString('TOKEN')!,
    };
  }
}
