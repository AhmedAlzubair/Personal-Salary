import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/appcolor.dart';

import '../../../Controller/editHome.dart';
import 'text_input.dart';

class DescriptionEditInput extends StatelessWidget {
  final controller=Get.put(EditHomeController());
   DescriptionEditInput({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppColor.defaultPadding/2,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Description',style: TextStyle(fontSize: 20,color: AppColor.white,fontWeight: FontWeight.bold),),
          ),
          TextInputField(
            controller: controller.description,
            hint: 'Description (Optional)',
            focus: controller.descriptionFocus.value,
            onTap: ()=>controller.setDescriptionFocus(),)
          // Obx(() => TextInputField(
          //   controller: controller.description.value,
          //   hint: 'Description (Optional)',
          //   focus: controller.descriptionFocus.value,
          //   onTap: ()=>controller.setDescriptionFocus(),))
        ],
      ),
    );
  }
}