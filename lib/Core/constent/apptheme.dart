
import 'package:flutter/material.dart';

import 'appcolor.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  iconTheme:const IconThemeData(color: AppColor.primaryColor),
  floatingActionButtonTheme:
     const FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  appBarTheme: AppBarTheme( 
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
    titleTextStyle:const  TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: "PlayfairDisplay",
        fontSize: 20),
    backgroundColor: Colors.grey[50],
  ),
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
      headlineMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
