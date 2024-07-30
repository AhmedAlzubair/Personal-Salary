class ListTask {
  int? list_id;
  String? list_name;
 
  ListTask({this.list_id, this.list_name});

// Convert a Task into Map
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['list_id'] = list_id;
    map['list_name'] = list_name;

    return map;
  }

  ListTask.toMap2(Map<String, dynamic> map) {
    //var map = new Map<String, dynamic>();
    list_id = map['list_id'];
    list_name = map['list_name'];

  }
}