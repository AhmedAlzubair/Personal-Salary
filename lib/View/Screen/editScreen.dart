import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/appcolor.dart';

import '../../Controller/addHome.dart';
import '../../Controller/editHome.dart';
import '../Widget/EditScreenCustom.dart';
import '../Widget/edit_task/dateEdit_time.dart';
import '../Widget/edit_task/descriptionEdit_input.dart';
import '../Widget/edit_task/lableEdit_input.dart';
import '../Widget/textFieldcustom.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditHomeController controller = Get.put(EditHomeController());
    return Scaffold(
      backgroundColor: AppColor.green2,
      appBar: AppBar(
        backgroundColor: AppColor.green2,
        title: const Text(
          "Edit Test",
          style: TextStyle(color: AppColor.white),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<EditHomeController>(
        builder: (controller) => SingleChildScrollView(
          child: Container(
            // margin:const EdgeInsets.all(10),
            //color: AppColor.green2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             LabelEditInput(),
              const SizedBox(
                height:AppColor.defaultPadding,
              ),
             DescriptionEditInput(),
              // TextFieldCustom(label: "What do Job?",hint: "Enter Here Job",icon: Icons.voice_chat_outlined,),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Edit List",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white),
                ),
              ),
              const SizedBox(
                height: AppColor.defaultPadding,
              ),
              const EditScreenCustom(),
        
              DateEditTimeInput(),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed(AppRoute.EditTaskScreen);
          controller.updateT();
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
