import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controller/addHome.dart';
import '../../../../Core/constent/appcolor.dart';

class CreateTaskButton extends StatelessWidget {
   CreateTaskButton({super.key});
   final controller=Get.put(AddHomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),
              topLeft: Radius.circular(80)),
          gradient: LinearGradient(colors: [
            AppColor.lightOrange,
            AppColor.darkOrange,
            AppColor.darkOrange,
          ])),
      child: Obx(() => controller.loading.value ? Container(
        height: 15,
        width: 15,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ) :const Text(
        'Create Task',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),)
    );
  }
}
