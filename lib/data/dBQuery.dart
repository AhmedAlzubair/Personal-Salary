import 'package:task_managment_users/model/list.dart';


import '../Core/constent/creatDB.dart';
import '../model/taskModel.dart';


class DBQuery {
  CreateDBTest dbHelper = CreateDBTest();

  // Query to insert into Database
  saveTaskModel(TaskModel task) async {
    var dbClient = await dbHelper.datebase;
   return await dbClient.insert(CreateDBTest.tableTestModel, task.toMap());
   // print('task has been saved' + '   ${task.key}');
    //return task;
  }
  getAllTaskModel() async {
    // mytask.clear();
    List<TaskModel> mytask = [];
    final dbClient = await dbHelper.datebase;
    final List<Map<String, dynamic>> mytasks =
        await dbClient.query(CreateDBTest.tableTestModel);
    mytask.addAll(mytasks.map((e) => TaskModel.fromMap(e)));
    // update();
    return mytask;
  }


  saveList(ListTask task) async {
    var dbClient = await dbHelper.datebase;
    task.list_id = await dbClient.insert(CreateDBTest.listTest, task.toMap());
    print('task has been saved' + '   ${task.list_id}');
    return task.list_id;
  }


  Future<int> updateList(ListTask task) async {
    final dbClient = await dbHelper.datebase;
    return await dbClient.update(CreateDBTest.listTest, task.toMap(),
        where: '${CreateDBTest.list_task} = ?', whereArgs: [task.list_id]);
  }





  getTaskMode(String id) async {
    // mytask.clear();
    //late Task mytask;
    List<TaskModel> myList = [];
    final dbClient = await dbHelper.datebase;
    final List<Map<String, dynamic>> mytasks = await dbClient.query(
        CreateDBTest.tableTestModel,
        where: '${CreateDBTest.tasks_title} LIKE ?',
        whereArgs: ["%$id%"]);
    // dbClient.
    myList.addAll(mytasks.map((e) => TaskModel.fromMap(e)));
    // update();
    print(myList);
    return myList;
  }

  getAllListTask() async {
    List<ListTask> myList = [];
    final dbClient = await dbHelper.datebase;
    final List<Map<String, dynamic>> mylists =
        await dbClient.query(CreateDBTest.listTest);
    myList.addAll(mylists.map((e) => ListTask.toMap2(e)));
    return myList;
  }


  // Update a Raw in DB
 Future<int>  updateTaskModel(TaskModel tsk) async {
    var dbClient = await dbHelper.datebase;
    return await dbClient.update(CreateDBTest.tableTestModel, tsk.toMap(),
        where: '${CreateDBTest.tasks_key} = ?', whereArgs: [tsk.key]);

      
  }


//Delete a Raw in DB
  Future<int> deleteTaskModel(String id) async {
    var dbClient = await dbHelper.datebase;
    return await dbClient.delete(CreateDBTest.tableTestModel,
        where: '${CreateDBTest.tasks_key} = ?', whereArgs: [id]);
  }

//Delete a Raw in DB
  Future<int> deleteList(int id) async {
    var dbClient = await dbHelper.datebase;
    return await dbClient.delete(CreateDBTest.listTest,
        where: '${CreateDBTest.list_task} = ?', whereArgs: [id]);
  }

  Future<void> closeDB() async {
    print('Closing Database');
    await CreateDBTest.db!.close();
  }
}
