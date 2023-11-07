

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';


import '../model/task_model.dart';


class TodoProvider extends ChangeNotifier {
  Box<Task> todoBox = Hive.box<Task>('students');

  List<Task> get todos => todoBox.values.toList();

  int currentBottomNavIndex = 0;

  Future<void> bottomNavbar(value) async {
    currentBottomNavIndex = value;
    notifyListeners();
  }

  void addTodo(String desc, String task, bool done) {
    final todo = Task(
      description: desc,
      title: task,
      isCompleted: done,
    );
    todoBox.add(todo);
    notifyListeners();
  }

  void updateTodo(int index, String task, String desc, bool done) {
    final todo = Task(
      title: task,
      description: desc,
      isCompleted: done,
    );
    todoBox.putAt(index, todo);
    notifyListeners();
  }

  void removeTodo(int index) {
    todoBox.deleteAt(index);
    notifyListeners();
  }
}
