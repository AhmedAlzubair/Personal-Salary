import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CreateDBTest {
  static String dbTest = "taskDB";
  static String tableTest = "Test";
  static String tableTestModel = "Tasks";
  static String tasks_key= "key";
  static String tasks_title= "title";
  static String listTest = "ListTest";
  static const String t_name = 'test_name';
  static const String t_id = 'test_id';
  static const String t_day = 't_day';
  static const String t_month = 't_month';
  static const String t_year = 't_year';
  static const String dayName = 'dayName';
  static const String t_hour = 't_hour';
  static const String t_minute = 't_minute';
  static const String list_task = 'list_id';
  static const String table_user = 'users';
  static const String user_approve = 'user_approve';
  static const String user_verfiycode = 'user_verfiycode';
  static const String user_phone = 'user_phone';
  static const String user_email = 'user_email';
  static const String user_password= 'user_password';
  static const String user_name= 'user_name';
  static const String user_id= 'user_id';
  static const String user_type= 'user_type';

  static Database? db;
  Future<Database> get datebase async {
    if (db != null) {
      //await db!.execute("drop database testDB");
      return db!;
    }
    db = await initDatabase();
    return db!;
  }

  initDatabase() async {
    var databasepath = await getDatabasesPath();
    print(databasepath);
    var pathJoin = join(databasepath, dbTest);
    var db = await openDatabase(pathJoin, version: 1, onCreate: onCreate);
    return db;
  }

  onCreate(Database db, int version) async {
    //var dd = db.batch();
     
    await db.execute(
        'CREATE TABLE ListTest (list_id INTEGER PRIMARY KEY, list_name TEXT)');

   await db.execute("CREATE TABLE Tasks(key TEXT PRIMARY KEY,title TEXT,description TEXT,date TEXT,startTime TEXT,periority TEXT,show TEXT,endTime TEXT,status TEXT,list_id INTEGER, FOREIGN KEY (list_id)  REFERENCES listTest(list_id))");

  }

  
}
