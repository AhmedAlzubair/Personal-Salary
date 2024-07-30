import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:task_managment_users/Controller/homeController.dart';
import 'package:task_managment_users/model/taskModel.dart';

import '../../Core/constent/appcolor.dart';
import '../../model/list.dart';


class CardCustom extends GetView<HomeControllerImp> {
  final TaskModel task;
  final String name;
  final String id;
  const CardCustom({
    super.key,
    required this.task,
    required this.name,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder:(controller) => 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Dismissible(
          direction: DismissDirection.startToEnd,
          key: UniqueKey(),
          background: Container(
            color: AppColor.primaryColor,
            child: Icon(Icons.delete,color: AppColor.white,),
          ),
          onDismissed: (direction) {
            controller.deleteTaskModel(id);
          },
          child: Card(
            color: Colors.blue,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_box_outline_blank_outlined,
                        size: 30,
                      ),
                    ),
                     Text(textAlign:TextAlign.center,
                        task.title!,
                        style: TextStyle(fontSize: 22,color: AppColor.white),
                      ),
                    
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        task.startTime.toString() +"-"+task.endTime.toString(),
                        // task.time.day.toString() +
                        //     "/" +
                        //     task.time.month.toString() +
                        //     "/" +
                        //     task.time.year.toString() +
                        //     "\n \n" +
                        //     task.time.hour.toString() +
                        //     ":" +
                        //     task.time.minute.toString(),
                        // "${Jiffy(task.time!, "yyyy-MM-dd").fromNow()}",
                        style: TextStyle(fontSize: 20,color: AppColor.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 20,color: AppColor.white),
                          ),
                          IconButton(
                              onPressed: () {
                                controller.goToEdit(task, name);
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppColor.white,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
