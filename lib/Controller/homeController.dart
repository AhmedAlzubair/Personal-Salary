import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:task_managment_users/Core/class/statusrequest.dart';

import '../Core/constent/creatDB.dart';
import '../Core/constent/routers.dart';
import '../data/dBQuery.dart';
import '../model/list.dart';
import '../model/taskModel.dart';

import 'auth/firebaseService.dart';

class HomeControllerImp extends SearchMixController {
  CreateDBTest dbHelper = CreateDBTest();
  DBQuery dBQuery = DBQuery();
  List<TaskModel> mytaskModel = [];
  // List<Task> searchTa = [];
  List<ListTask> myList = [];
  FirebaseService firebaseService = FirebaseService();
  late TextEditingController test_name;
  late TextEditingController test_date;
  late TextEditingController list_name;
  StatusRequest statusRequest = StatusRequest.none;

  // late TextEditingController search_name;
  String? nameDe;
  int? listid;
  onChange(int id, String name) {
    nameDe = name;
    listid = id;
    update();
  }

  // Query to get All tasks in the Database
  late Database dbClient;
  onIntion() async {
    dbClient = await dbHelper.datebase;
    getAllListTask();
    getAllTaskModel();
  }

  @override
  void onInit() {
    onIntion();
    test_name = TextEditingController();
    test_date = TextEditingController();
    list_name = TextEditingController();
    search_name = TextEditingController();
    super.onInit();
  }

  getAllTaskModel() async {
    mytaskModel.clear();
    mytaskModel.addAll(await dBQuery.getAllTaskModel());
    //print(mytaskModel[0].startTime);
    //myTask = mytask as Future<List<Task>>;
    if (mytaskModel.isNotEmpty) {
      statusRequest = StatusRequest.success;
      update();
    }
    update();
    // return mytask ;
  }

  deleteTaskModel(String id) async {
    Get.defaultDialog(
      title: "Are you Sure?",
      middleText: "The Task Will Be Deleted",
      onConfirm: () async {
        mytaskModel.removeWhere((element) => element.key == id);

        int taskid = await dBQuery.deleteTaskModel(id);
        print(taskid);
        Get.close(1);
        update();
        getAllTaskModel();
      },
      onCancel: () {
        Get.close(1);
      },
    );

    update();
  }

  getAllListTask() async {
    myList.clear();
    //myList = await dBQuery.getAllListTask();
    myList.addAll(await dBQuery.getAllListTask());
    // myLists = myList as Future<List<ListTask>>;
    update();
    if (myList.isEmpty) {
      nameDe = "";
    } else {
      nameDe = myList.first.list_name;
    }

    //return myList;
  }

  goToEdit(TaskModel task, String name) {
    Get.toNamed(AppRoute.editTaskScreen,
        arguments: {"task": task, "name": name});
  }

  schedulingNotification(TaskModel task) {
    // DateTime dateTime =
    //     DateFormat.HM().parse(task.endTime.toString().split(" ")[0]);
    DateTime dateTime = DateFormat.Hm().parse(task.endTime.toString());
    print(dateTime);
    var myTime = DateFormat("HH:mm").format(dateTime);
    int houre = int.parse(myTime.toString().split(":")[0]);
    int menites = int.parse(myTime.toString().split(":")[1]);
    DateTime date = DateFormat.d().parse(task.date.toString());
    String formattedDate = DateFormat('EEE').format(date);
    //int days = int.parse(formattedDate);
    print(formattedDate);
    firebaseService.schedulingNotification(houre, menites, task);
  }
}

class SearchMixController extends GetxController {
  List<TaskModel> searchTa = [];
  DBQuery dBQuery = DBQuery();
  bool isSearch = false;
  TextEditingController? search_name;
  getSearchTask() async {
    searchTa.clear();
    //myList =
    //searchTa=  await dBQuery.getTask2(search_name.text);
    searchTa.addAll(await dBQuery.getTaskMode(search_name!.text));
    // myLists = myList as Future<List<ListTask>>;
    update();
    // nameDe = myList.first.list_name;
  }

  checkSearch(val) {
    if (val == "") {
      // statusRequest = StatusRequest.none;
      isSearch = false;
      search_name!.clear();
    }
    update();
  }

  onSearchTask() {
    isSearch = true;
    getSearchTask();
    update();
  }
}
