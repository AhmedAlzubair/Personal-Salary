import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_managment_users/Core/constent/routers.dart';

import 'package:task_managment_users/View/Widget/textFieldcustom.dart';

import '../../Controller/homeController.dart';
import '../../Core/constent/appcolor.dart';
import '../Screen/settings.dart';
import 'dropdowncustomHome.dart';

class AppParCustom extends StatelessWidget {
  // final int id;
  const AppParCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              //color: Colors.blue,
              padding: const EdgeInsets.only(left: 6, right: 6),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        // IconButton(onPressed: (){
                        //
                        // }, icon: Icon(Icons.check,color: Colors.green,),),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.settings,color: AppColor.white,),
                              onPressed: () {
                                Get.toNamed(AppRoute.settings);
                              },
                            )),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: controller.search_name,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.white),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              controller.checkSearch(value);
                            },
                            decoration: InputDecoration(
                              //fillColor:
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: AppColor.white,
                                ),
                                onPressed: () {
                                  controller.onSearchTask();
                                },
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                  color: AppColor.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DropdownButton(
                              alignment: AlignmentDirectional.bottomStart,
                              focusColor: AppColor.primaryColor,
                              dropdownColor: AppColor.green2,
                              items: [
                                ...List.generate(
                                    controller.myList.length,
                                    (index) => DropdownMenuItem(
                                          // alignment: Alignment.topLeft,
                                          value: controller
                                              .myList[index].list_name,
                                          child: Text(
                                            controller.myList[index].list_name!,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.white),
                                          ),
                                          onTap: () {
                                            controller.onChange(
                                                controller
                                                    .myList[index].list_id!,
                                                controller
                                                    .myList[index].list_name!);
                                          },
                                        ))
                              ],
                              value: controller.nameDe,
                              onChanged: (val) {
                                controller.nameDe = val;
                              }),

                          // DropDownCustom(myList: controller.myList)
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.check,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
