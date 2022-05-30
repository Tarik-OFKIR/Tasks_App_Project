import 'package:get/get.dart';
import 'package:tasks_projet_innovation_front/db/db_helper.dart';

import '../models/task.dart';

class TaskController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }

  var taskList = <TaskModel>[].obs;

  Future<int> addTask({TaskModel? task}) async{
    return await DBHelper.insert(task);
  }

  void getTasks() async{
    List<Map<String, dynamic>> tasks= await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new TaskModel.fromJson(data)).toList());
  }
  void delete(TaskModel task){
    DBHelper.delete(task);
    getTasks();
  }
  void markTaskCompleted(int id) async{
    await DBHelper.update(id);
    getTasks();
  }
}