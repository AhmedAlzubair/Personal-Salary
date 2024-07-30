
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/routers.dart';

import 'Core/middleware/middleware.dart';
import 'View/Screen/addScreen.dart';
import 'View/Screen/auth/login.dart';
import 'View/Screen/auth/signup.dart';
import 'View/Screen/auth/success_signup.dart';
import 'View/Screen/editScreen.dart';
import 'View/Screen/home.dart';
import 'View/Screen/language.dart';
import 'View/Screen/onboarding.dart';
import 'View/Screen/settings.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page:() =>const  OnBoarding(),middlewares:[MyMiddleWare()] ),
  GetPage(name: AppRoute.home, page:() =>const  HomePage()),
  GetPage(name: AppRoute.addTest, page:() =>const  AddTest()),
  GetPage(name: AppRoute.editTaskScreen, page:() =>const  EditTaskScreen()),
 GetPage(name: AppRoute.language
 , page:() =>const  Language()),
   GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),

  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
 GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
 GetPage(name: AppRoute.settings, page: () => const Settings()),

];
