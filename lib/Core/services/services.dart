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
// const firebaseConfig = {
//   apiKey: "AIzaSyA0-daKDKOj6diNWeDMmAW6P0dLXEnulSs",
//   authDomain: "taskapp-2c7d1.firebaseapp.com",
//   databaseURL: "https://taskapp-2c7d1-default-rtdb.firebaseio.com",
//   projectId: "taskapp-2c7d1",
//   storageBucket: "taskapp-2c7d1.appspot.com",
//   messagingSenderId: "638409996823",
//   appId: "1:638409996823:web:1e843ad790ebad87fa3a52",
//   measurementId: "G-CSB7M41WC2"
// };

// Initialize Firebase
// const app = initializeApp(firebaseConfig);
// const analytics = getAnalytics(app);
  Future<MyServices> init() async {
   
//     await Firebase.initializeApp(
//         options: const FirebaseOptions(
//   apiKey: "AIzaSyA0-daKDKOj6diNWeDMmAW6P0dLXEnulSs",
//   authDomain: "taskapp-2c7d1.firebaseapp.com",
//   databaseURL: "https://taskapp-2c7d1-default-rtdb.firebaseio.com",
//   projectId: "taskapp-2c7d1",
//   storageBucket: "taskapp-2c7d1.appspot.com",
//   messagingSenderId: "638409996823",
//   appId: "1:638409996823:web:1e843ad790ebad87fa3a52",
//   measurementId: "G-CSB7M41WC2" // Your projectId
//  ),
//     );
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  initialServices() async {
    await Get.putAsync(() => MyServices().init());
  }
}
