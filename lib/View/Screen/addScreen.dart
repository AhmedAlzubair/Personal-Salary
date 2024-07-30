import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/appcolor.dart';

import '../../Controller/addHome.dart';
import '../Widget/addScreenCustom.dart';
import '../Widget/new_task/components/date_time.dart';
import '../Widget/new_task/components/description_input.dart';
import '../Widget/new_task/components/lable_input.dart';
import '../Widget/textFieldcustom.dart';

class AddTest extends StatelessWidget {
  const AddTest({super.key});

  @override
  Widget build(BuildContext context) {
    AddHomeController controller = Get.put(AddHomeController());
    return Scaffold(
      backgroundColor: AppColor.green2,
      appBar: AppBar(
        backgroundColor: AppColor.green2,
        title: const Text(
          "New Task",
          style: TextStyle(color: AppColor.white),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<AddHomeController>(
        builder: (controller) => SingleChildScrollView(
          child: Container(
            // margin:const EdgeInsets.all(10),
            //color: AppColor.green2,
            child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     LabelInput(),
                       const SizedBox(
                height: AppColor.defaultPadding,
              ),
             DescriptionInput(),
              const SizedBox(
                height: AppColor.defaultPadding,
              ),
            
              // TextFieldCustom(label: "What do Job?",hint: "Enter Here Job",icon: Icons.voice_chat_outlined,),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Add To List",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ),
              const SizedBox(
                height: AppColor.defaultPadding,
              ),
              const AddScreenCustom(),
               const SizedBox(
                height: AppColor.defaultPadding,
              ),
              DateTimeInput(),
            
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed(AppRoute.addTest);
          controller.saveTask();
        },
        backgroundColor: AppColor.white,
        child: const Icon(
          Icons.check,
          size: 24,
          color: AppColor.blue,
        ),
      ),
    );
  }
}
