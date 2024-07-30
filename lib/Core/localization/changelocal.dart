//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../Controller/auth/firebaseService.dart';
import '../constent/apptheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();
  FirebaseService? firebaseService;

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    firebaseService = FirebaseService();
    firebaseService!.intial();
    firebaseService!.requestPermissionNotification();
    firebaseService!.setupInteractedMessage2();
    firebaseService!.setupInteractedMessage();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      //language = Locale(Get.deviceLocale!.languageCode);
      language = const Locale("en");
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
