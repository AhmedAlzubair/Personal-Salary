import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_managment_users/Core/constent/routers.dart';
import '../../Controller/homeController.dart';
import '../../Core/class/handlingdataview.dart';
import '../../Core/constent/appcolor.dart';
import '../Widget/apppar.dart';
import '../Widget/cardcustom.dart';
import '../Widget/dropdowncustomHome.dart';
import 'settings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.green2,

        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              //color: AppColor.green2,
              padding: const EdgeInsets.only(top: 10),
              // margin:const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppParCustom(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Task",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    GetBuilder<HomeControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ?
                    ListView.builder(
                            itemCount: controller.mytaskModel.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              int list_id =
                                  controller.mytaskModel[index].list_id!;
                              // int list_id = snapshot.data![index].list_id!;
                              print(list_id);
                              final list = controller.myList.firstWhere(
                                  (element) => element.list_id == list_id);
                              String nameList = list.list_name!;
                              // DateTime dateTime = DateFormat.jm().parse(
                              //     controller.mytaskModel[index].startTime
                              //         .toString());
                              // var myTime = DateFormat("HH:mm").format(dateTime);
                              controller.schedulingNotification(
                              //   int.parse(myTime.toString().split(":")[0]),
                              // int.parse(myTime.toString().split(":")[1]),
                              controller.mytaskModel[index]);
                        
                              return CardCustom(
                                  task: controller.mytaskModel[index],
                                  name: nameList,
                                  id: controller.mytaskModel[index].key!);
                            })
                        : ListView.builder(
                            itemCount: controller.searchTa.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              int list_id = controller.searchTa[index].list_id!;
                              // int list_id = snapshot.data![index].list_id!;
                              // print(list_id);
                              final list = controller.myList.firstWhere(
                                  (element) => element.list_id == list_id);
                              String nameList = list.list_name!;
                              return CardCustom(
                                  task: controller.searchTa[index],
                                  name: nameList,
                                  id: controller.searchTa[index].key!);
                            })
              ))
                  ],
                ),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addTest);
          },
          backgroundColor: AppColor.white,
          child: const Icon(
            Icons.add,
            size: 24,
            color: AppColor.blue,
          ),
        ),
        // floatingActionButtonLocation: ,
      ),
    );
  }
}
