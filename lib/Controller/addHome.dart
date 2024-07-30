import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_managment_users/Core/constent/routers.dart';

import '../Core/class/utils.dart';
import '../Core/constent/creatDB.dart';
import '../data/dBQuery.dart';
import '../model/list.dart';
import '../model/taskModel.dart';
import 'auth/firebaseService.dart';

class AddHomeController extends GetxController {
  late TextEditingController listTask;
  FirebaseService firebaseService = FirebaseService();
  CreateDBTest dbHelper = CreateDBTest();
  DBQuery dBQuery = DBQuery();
  DateTime? pickedDate;
  List<ListTask> myList = [];
  RxBool lowPeriority = false.obs;
  RxBool labelFocus = false.obs;
  RxBool categoryFocus = false.obs;
  RxBool descriptionFocus = false.obs;
  RxString selectedDate = ''.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxBool loading = false.obs;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  TaskModel? taskModel;
  late TextEditingController test_name;
  late TextEditingController test_date;
  late TextEditingController list_name;
  late TextEditingController description;
  late Database dbClient;
  String? nameDe;
  onIntion() async {
    dbClient = await dbHelper.datebase;
    getAllListTask();
  }

  int? listid;
  String? dateTimeAndTimeOf;
  onChange(int id, String name) {
    nameDe = name;
    print(id);
    listid = id;
    update();
  }

  @override
  void onInit() {
    onIntion();
    test_name = TextEditingController();
    test_date = TextEditingController();
    list_name = TextEditingController();
    listTask = TextEditingController();
    description = TextEditingController();

    super.onInit();
  }

  setDescriptionFocus() {
    labelFocus.value = false;
    categoryFocus.value = false;
    descriptionFocus.value = true;
  }

  getAllListTask() async {
    myList.clear();
    myList.addAll(await dBQuery.getAllListTask());
    //update();
    if (myList.isEmpty) {
      nameDe = "";
    } else {
      print("===========================${myList.first.list_id!}");
      print("===========================${myList.first.list_name!}");
      onChange(myList.first.list_id!, myList.first.list_name!);
    }
    update();
  }

  clean() {
    test_date.clear();
    test_name.clear();
    list_name.clear();
  }

  saveTask() async {
    // Task task =
    //     Task(t_id: null, t_name: test_name.text, time: time!, list_id: listid);
    print(startTime.value.toString());
    taskModel = TaskModel(
        key: DateTime.now().microsecondsSinceEpoch.toString(),
        startTime: startTime.value.toString(),
        endTime: endTime.value.toString(),
        date: selectedDate.value.toString(),
        periority: lowPeriority.value ? 'Low' : 'High',
        description: description.text.toString(),
        //category: category.value.text.toString(),
        title: test_name.text.toString(),
        //image: selectedImage.value.toString(),
        show: 'yes',
        list_id: listid,
        status: 'unComplete');

    int id = await dBQuery.saveTaskModel(taskModel!);
    firebaseService.displayingnotification(
        test_name.text.toString(), description.text.toString());
    print(id);
    firebaseService.sendNotfiy(taskModel!.title.toString(),
        taskModel!.description.toString(), taskModel!.key.toString(), "home");

    update();
    clean();
    //Get.toNamed(AppRoute.home);
    Get.offAllNamed(AppRoute.home);
    // return task;
  }

  saveList() async {
    ListTask task = ListTask(list_id: null, list_name: list_name.text);
    int id = await dBQuery.saveList(task);
    if (myList.isEmpty) {
      listid = id;
    }
    getAllListTask();
    update();
  }

  deleteList(int id) async {
    Get.defaultDialog(
      title: "Are you Sure?",
      middleText: "The List Will Be Deleted",
      onConfirm: () async {
        myList.removeWhere((element) => element.list_id == id);

        int taskid = await dBQuery.deleteList(id);
        print(taskid);
        Get.close(1);
        update();
        getAllListTask();
      },
      onCancel: () {
        Get.close(1);
      },
    );

    update();
  }

  picStartTime(BuildContext context) async {
    var picker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picker != null) {
      startTime.value =
          '${Utils.addPrefix(picker.hourOfPeriod.toString())}:${Utils.addPrefix(picker.minute.toString())}${" "}${picker.period.name.toUpperCase()}';
    }
  }

  picEndTime(BuildContext context) async {
    var picker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picker != null) {
      endTime.value =
          '${Utils.addPrefix(picker.hourOfPeriod.toString())}:${Utils.addPrefix(picker.minute.toString())}${" "}${picker.period.name.toUpperCase()}';
    }
  }

  showDatePick(BuildContext context) async {
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 7)));
    if (picker != null) {
      pickedDate = picker;
      selectedDate.value =
          '${Utils.addPrefix(picker.day.toString())}/${Utils.addPrefix(picker.month.toString())}/${picker.year}';
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    test_date.clear();
    test_name.clear();
    list_name.clear();
    super.dispose();
  }
}
