import 'dart:async';

import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget with ChangeNotifier {
  TasksList({
    Key? key,
  }) : super(key: key);

  List<Task> _tasks = [
    Task(name: "Buy milk"),
    Task(name: "Buy eggs"),
    Task(name: "Buy bread"),
  ];
  void addElement(String? taskName) {
    if (taskName != null) _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void deleteElement(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  get Tasks {
    return _tasks;
  }

  void updateCheckBox(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksList>(
      builder: (context, Tasklist, widget) => ListView.builder(
        itemCount: Tasklist._tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTile: Tasklist._tasks[index].name,
            isChecked: Tasklist._tasks[index].isDone,
            onTap: (value) {
              Provider.of<TasksList>(context, listen: false)
                  .updateCheckBox(Tasklist._tasks[index]);
            },
            onLongTap: () {
              Provider.of<TasksList>(context,listen: false)
                  .deleteElement(Tasklist._tasks[index]);
              // print(_tasks.map((e) => e.name));
            },
          );
        },
      ),
    );
  }
}
