import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/appcolor.dart';

import '../../../Controller/editHome.dart';


class DateEditTimeInput extends StatelessWidget {
  DateEditTimeInput({super.key});

  final controller = Get.put(EditHomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date',
                style:
                    TextStyle( color: AppColor.white,
                      fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: AppColor.defaultPadding / 2,
              ),
              InkWell(
                  onTap: () => controller.showDatePick(context),
                  child: Obx(() => DateTimeContainer(
                      text: controller.selectedDate.isEmpty
                          ? 'dd/mm/yyyy'
                          : controller.selectedDate.value)))
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'S-Time',
                style:
                    TextStyle( color: AppColor.white,
                      fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: AppColor.defaultPadding / 2,
              ),
              InkWell(
                  onTap: () => controller.picStartTime(context),
                  child: Obx(() => DateTimeContainer(
                      text: controller.startTime.isEmpty
                          ? "hh:mm:a"
                          : controller.startTime.value)))
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'E-Time',
                style:
                    TextStyle( color: AppColor.white,
                      fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: AppColor.defaultPadding / 2,
              ),
              InkWell(
                  onTap: () => controller.picEndTime(context),
                  child: Obx(() => DateTimeContainer(
                      text: controller.endTime.isEmpty
                          ? "hh:mm:a"
                          : controller.endTime.value)))
            ],
          ),
        ],
      ),
    );
  }
}

class DateTimeContainer extends StatelessWidget {
  const DateTimeContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            Icons.date_range,
            color: AppColor.white,
            size: 16,
          ),
          SizedBox(
            width: AppColor.defaultPadding / 4,
          ),
          Text(text),
        ],
      ),
    );
  }
}
