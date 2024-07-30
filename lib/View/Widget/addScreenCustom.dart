import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Controller/addHome.dart';

import '../../Core/constent/appcolor.dart';
import 'dropdownCustomAdd.dart';

class AddScreenCustom extends GetView<AddHomeController> {
  const AddScreenCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AddHomeController>(
      builder: (controller) => 
   Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                const  Expanded(
                    flex: 2,
                    child:
                     DropDownCustomAdd(),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Add List'),
                                    content: SizedBox(
                                      height: 150,
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: controller.list_name,
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: ()  {
                                                   
                                                        controller.saveList();
                                                        Navigator.pop(context);
                                                      
                                                    }
                                                  ,
                                                  child: const Text('OK'),
                                                ),
                                                MaterialButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Cancel'))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon:const Icon(
                            Icons.list_outlined,
                            color: AppColor.white,
                          ))),
                ],
              ),
    );
  }
}