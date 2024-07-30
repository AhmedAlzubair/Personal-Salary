import 'dart:core';

class TaskModel {
  String? key;
  String? title;
  // String? category;
  String? description;
  // String? image;
  String? periority;
  String? startTime;
  String? endTime;
  String? date;
  String? show;
  String? status;
 int? list_id;
  TaskModel(
      { required this.key,
       required this.startTime,
       required this.endTime,
        required this.date,
        required this.periority,
        required this.description,
        // required this.category,
        required this.title,
        // required this.image,
        required this.show,
        required this.status,
        required this.list_id
        });

  TaskModel.fromMap(Map<String, dynamic> res) {
    key = res['key'];
    title = res['title'];
   // category = res['category'];
    description = res['description'];
    //image = res['image'];
    periority = res['periority'];
    show = res['show'];
    startTime = res['startTime'];
    endTime = res['endTime'];
    date = res['date'];
    status=res['status'];
      list_id = res['list_id'];
  }

  Map<String, Object?> toMap() {
    return {
      'key': key,
      'title': title,
      //'category': category,
      'description': description,
      //'image': image,
      'periority': periority,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'show': show,
      'status' : status,
      ' list_id':list_id
    };
  }
}