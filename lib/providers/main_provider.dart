import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../models/task.dart';
import '../services/api_service.dart';

class MainProvider with ChangeNotifier{
  List<TaskModel> tasks =[];

  Future<String> getTasksFromUser(int userId) async {
    try {
      Response response = await ApiService.getTasks(userId);
      tasks = [];
      var json = jsonDecode(response.body);
      for (var element in json) {
        TaskModel task = TaskModel.fromJson(element);
        tasks.add(task);
      }
      notifyListeners();
      return '0';
    } catch (e) {
      return e.toString();
    }
  }
}