import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/addHome.dart';
import '../../Core/constent/appcolor.dart';
import '../../model/list.dart';

class DropDownCustomAdd extends StatelessWidget {
  // final List<ListTask> myList;
  //final controller;
  const DropDownCustomAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(AddHomeController());
    return GetBuilder<AddHomeController>(
        builder: (controller) => DropdownButton(
            alignment: AlignmentDirectional.bottomStart,
            focusColor: AppColor.primaryColor,
            dropdownColor: AppColor.green2,
            borderRadius: BorderRadius.circular(20),
            items: [
              ...List.generate(
                  controller.myList.length,
                  (index) => DropdownMenuItem(
                        // alignment: Alignment.topLeft,
                        value: controller.myList[index].list_name,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.myList[index].list_name!,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.white),
                              ),
                            ),
               if(controller.myList[index].list_name!=controller.nameDe)             IconButton(
                                onPressed: () {
                                  controller.deleteList(
                                      controller.myList[index].list_id!);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColor.white,
                                ))
                          ],
                        ),
                        onTap: () {
                          controller.onChange(controller.myList[index].list_id!,
                              controller.myList[index].list_name!);
                        },
                      ))
            ],
            value: controller.nameDe,
            onChanged: (val) {
              //controller.nameDe = val;
            }
            ));
  }
}
