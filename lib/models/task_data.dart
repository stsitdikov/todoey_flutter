import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Add tasks'),
    Task(name: 'Check tasks off by pressing the box on the right'),
    Task(name: 'Delete checked tasks by long pressing the name of the task'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void newTask(newTaskName) {
    _tasks.add(Task(name: newTaskName));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    if (_tasks[index].isDone == true) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }
}
