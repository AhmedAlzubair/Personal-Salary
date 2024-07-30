import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/editHome.dart';
import '../../Core/constent/appcolor.dart';
import 'dropDownCustomEdit.dart';

class EditScreenCustom extends GetView<EditHomeController> {
  const EditScreenCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<EditHomeController>(
      builder: (controller) => 
   Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                const  Expanded(
                    flex: 2,
                    child:
                     DropDownCustomEdit(),
                  ),
                  Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Edit List'),
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
                                                   
                                                        controller.upateL();
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