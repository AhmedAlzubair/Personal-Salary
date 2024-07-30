
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/appcolor.dart';
import '../../../Controller/editHome.dart';
import 'periority_container.dart';
import 'text_input.dart';

class LabelEditInput extends StatelessWidget {
   LabelEditInput({super.key});
  final controller=Get.put(EditHomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lable',
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: AppColor.defaultPadding/2,
                ),
                TextInputField(
                    controller: controller.test_name,
                    hint: 'Enter Label',
                    onTap: () {},
                    focus: true),
                // Obx(() => TextInputField(
                //     controller: controller.test_name,
                //     hint: 'Enter Label',
                //     onTap: () {},
                //     focus: true),),
              ],
            ),
          ),
          const SizedBox(
            width: AppColor.defaultPadding,
          ),
           Expanded(
            flex: 1,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Periority',
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: AppColor.defaultPadding / 2,
                ),
                Row(
                  children: [
                    Obx(() => InkWell(
                      onTap: () => controller.lowPeriority.value=true,
                        child: PeriorityContainer(text: 'Low', selected: controller.lowPeriority.value)),),
                    const SizedBox(
                      width: AppColor.defaultPadding / 2,
                    ),
                    Obx(() => InkWell(
                    onTap: () => controller.lowPeriority.value=false,
                        child: PeriorityContainer(text: 'High', selected: !controller.lowPeriority.value)),)
                  ],
                )
              ],
                     ),
           ),
        ],
      ),
    );
  }
}
