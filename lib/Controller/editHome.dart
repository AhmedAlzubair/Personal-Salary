import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_managment_users/Core/constent/routers.dart';
import 'package:task_managment_users/model/taskModel.dart';

import '../Core/class/utils.dart';
import '../Core/constent/creatDB.dart';
import '../data/dBQuery.dart';
import '../model/list.dart';
class EditHomeController extends GetxController {
  late TextEditingController listTask;
  CreateDBTest dbHelper = CreateDBTest();
  DBQuery dBQuery = DBQuery();
    DateTime? pickedDate;
  List<TaskModel> mytaskModel = [];

  late TaskModel taskModel;
  late RxBool lowPeriority;
  RxBool labelFocus = false.obs;
  RxBool categoryFocus = false.obs;
  RxBool descriptionFocus = false.obs;
   RxString selectedDate=''.obs;
   RxString startTime=''.obs;
   RxString endTime=''.obs;
  late String name;
  List<ListTask> myList = [];
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  TextEditingController test_name = TextEditingController();
  TextEditingController test_date = TextEditingController();
  TextEditingController list_name = TextEditingController();
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

  late String idTask;
  late int idlist;
  // late int idTask;
  // late int idlist;
   TextEditingController description=TextEditingController();
  @override
  void onInit() {
        taskModel = Get.arguments["task"];
    onIntion();
  
    //task = Get.arguments['task'];

    name = Get.arguments['name'];
    test_name.text = taskModel.title.toString();
    //time = task.time;

    idTask = taskModel.key!;
    listid = taskModel.list_id!;
    idlist = taskModel.list_id!;
    description.text = taskModel.description.toString();
    // selectedDate.value = taskModel.date.obs.toString();
    // startTime.value = taskModel.startTime.toString();
    // endTime.value = taskModel.endTime.toString();
    if (taskModel.periority.toString() == "Low") {
      lowPeriority = false.obs;
    } else {
      lowPeriority = true.obs;
    }

 
    nameDe = name;
    listTask = TextEditingController();

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
    update();
    list_name.text = name;
  }

  clean() {
    test_date.clear();
    test_name.clear();
    list_name.clear();
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

  updateT() async {
   TaskModel  taskModel2 = TaskModel(
        key: idTask ,
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
   int id=await  dBQuery.updateTaskModel(taskModel2);
     print('task has been Update' + '   ${id}');
    //mytask.add(task);
     // Get.offAllNamed(AppRoute.home);
     
      Get.toNamed(AppRoute.home);
   
    update();
  
    // clean();
  }
   picStartTime(BuildContext context) async {
    var picker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picker != null) {
      startTime.value =
          '${Utils.addPrefix(picker.hourOfPeriod.toString())}:${Utils.addPrefix(picker.minute.toString())}:${picker.period.name.toUpperCase()}';
    }
  }
  picEndTime(BuildContext context) async {
    var picker =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picker != null) {
      endTime.value =
          '${Utils.addPrefix(picker.hourOfPeriod.toString())}:${Utils.addPrefix(picker.minute.toString())}:${picker.period.name.toUpperCase()}';
    }
  }
  showDatePick(BuildContext context) async {
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 7)));
    if (picker != null) {
      pickedDate=picker;
      selectedDate.value =
          '${Utils.addPrefix(picker.day.toString())}/${Utils.addPrefix(picker.month.toString())}/${picker.year}';
    }
  }


  // Query to insert into Database
  upateL() async {
    ListTask list = ListTask(list_id: idlist, list_name: list_name.text);
    list.list_id = await dBQuery.updateList(list);
    update();
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
