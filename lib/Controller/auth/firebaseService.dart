import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:task_managment_users/Core/class/statusrequest.dart';

import '../../Core/class/utils.dart';
import '../../Core/constent/routers.dart';
import '../../View/Screen/home.dart';
import '../../model/taskModel.dart';
import '../../model/userPref.dart';
import 'login_controller.dart';
import 'signup_controller.dart';

class FirebaseService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static final signInController = Get.put(LoginControllerImp());
  static final signUpController = Get.put(SignUpControllerImp());
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  requestPermissionNotification() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  intial() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: false,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      // macOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(Text("data"));
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    Get.dialog(Text("data"));
  }

  displayingnotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: 'item x');
  }

  schedulingNotification(int houre, int menites, TaskModel task) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        task.title.toString(),
        task.description.toString(),
        tz.TZDateTime.now(tz.local)
            .add(Duration(hours: houre, seconds: menites)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
                'your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'home') {
      // GetPage(name: AppRoute.home, page: () => const HomePage());
      Get.toNamed(AppRoute.home);
    }
  }

  Future<void> setupInteractedMessage2() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification android = message.notification!.android!;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                'your channel id',
                'your channel name',
                channelDescription: 'your channel description',
                icon: android.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  sendNotfiy(String title, String body, String id, String type) async {
    String serverTok = "";

    await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Authorization': 'key=$serverTok ',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'notification': <String, dynamic>{
            "body": body,
            "title": title,
          },
          'priority': 'high',
          "data": <String, dynamic>{
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
            "sound": "default",
            'id': id.toString(),
            'type': type
          },
          'to': await FirebaseMessaging.instance.getToken()
        }));
  }

  static Future<void> createAccount() async {
    try {
      // signUpController.setLoading(true);
      final String str = signUpController.email.value.text.toString();
      final String node = str.substring(0, str.indexOf('@'));
      database.ref('Accounts').child(node).set({
        'name': '${signUpController.username.value.text} ',
        'email': signUpController.email.value.text.toString(),
        'password': signUpController.password.value.text.toString(),
      }).then((value) {
        auth
            .createUserWithEmailAndPassword(
                email: signUpController.email.value.text.toString(),
                password: signUpController.password.value.text.toString())
            .then((value) {
          UserPref.setUser(
              '${signUpController.username.value.text} ',
              signUpController.email.value.text.toString(),
              signUpController.password.value.text.toString(),
              node,
              value.user!.uid.toString());
          Utils.showSnackBar(
              'Sign up',
              "Account is successfully created",
              const Icon(
                Icons.done,
                color: Colors.white,
              ));
          Get.toNamed(AppRoute.login);
          //signUpController.setLoading(false);
        }).onError((error, stackTrace) {
          Utils.showSnackBar(
              'Error',
              Utils.extractFirebaseError(error.toString()),
              const Icon(
                FontAwesomeIcons.triangleExclamation,
                color: Colors.red,
              ));
          //signUpController.setLoading(false);
        });
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
            ));
        // signUpController.setLoading(false);
      });
    } catch (e) {
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ));
      // signUpController.setLoading(true);
    }
  }

  static Future<void> forgetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: signInController.email.text);
      Get.rawSnackbar(
          title: "اشعار",
          duration: const Duration(seconds: 1),
          messageText: const Text(" تم ارسال كود التحقق الى حسابك  "));
    } catch (error) {
      print(error);
      Get.rawSnackbar(
          title: "Error",
          duration: const Duration(seconds: 1),
          messageText: const Text(" Enter the Email   "));
    }
  }

  static Future<void> loginAccount() async {
    try {
      signInController.setStatusRequest(StatusRequest.loading);

      auth
          .signInWithEmailAndPassword(
        email: signInController.email.value.text.toString(),
        password: signInController.password.value.text.toString(),
      )
          .then((value) {
        String node =
            value.user!.email!.substring(0, value.user!.email!.indexOf('@'));
        database.ref('Accounts').child(node).onValue.listen((event) {
          UserPref.setUser(
            event.snapshot.child('name').value.toString(),
            event.snapshot.child('email').value.toString(),
            event.snapshot.child('password').value.toString(),
            node,
            value.user!.uid.toString(),
          );
          Utils.showSnackBar(
              'Sign up',
              "Successfully Login.Welcome Back!",
              const Icon(
                Icons.done,
                color: Colors.white,
              ));
          signInController.setStatusRequest(StatusRequest.success);
          Get.toNamed(AppRoute.home);
          // signInController.setLoading(false);
        }).onError((error, stackTrace) {
          Utils.showSnackBar(
              'Error',
              Utils.extractFirebaseError(error.toString()),
              const Icon(
                FontAwesomeIcons.triangleExclamation,
                color: Colors.red,
              ));
          signInController.setStatusRequest(StatusRequest.failure);
          Get.toNamed(AppRoute.login);
        });
      }).onError((error, stackTrace) {
        Utils.showSnackBar(
            'Error',
            Utils.extractFirebaseError(error.toString()),
            const Icon(
              FontAwesomeIcons.triangleExclamation,
              color: Colors.red,
            ));
        //signInController.setStatusRequest(StatusRequest.offlinefailure);
        Get.toNamed(AppRoute.login);
      });
    } catch (e) {
      Utils.showSnackBar(
          'Error',
          Utils.extractFirebaseError(e.toString()),
          const Icon(
            FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
          ));
      //signInController.setLoading(true);
      Get.toNamed(AppRoute.login);
    }
  }

  static Future<int> childCount() async {
    String str = auth.currentUser!.email.toString();
    String node = str.substring(0, str.indexOf('@'));
    return database.ref('Tasks').child(node).once().then((value) {
      return value.snapshot.children.length;
    });
  }

  static Future<void> update(
      String key, String updateKey, String updateValue) async {
    String str = auth.currentUser!.email.toString();
    String node = str.substring(0, str.indexOf('@'));
    database
        .ref('Tasks')
        .child(node)
        .child(key)
        .update({updateKey: updateValue});
  }
}
