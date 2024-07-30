import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/routers.dart';

import 'Core/localization/changelocal.dart';
import 'Core/localization/translation.dart';
import 'Core/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(  options: DefaultFirebaseOptions.currentPlatform,);
  await MyServices().initialServices();
  //  CreateDBTest dbHelper = CreateDBTest();

  //  Database dbClient = await dbHelper.datebase;
  //   dbClient.execute("drop database taskDB");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: controller.appTheme,
      title: 'Task Management Users',
      // color: Colors.red,
      // theme: ThemeData(
      //
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      // home:,
      getPages: routes,
    );
  }
}
