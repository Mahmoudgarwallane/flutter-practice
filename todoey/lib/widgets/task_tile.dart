import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {required this.isChecked, required this.taskTile, required this.onTap,required this.onLongTap});
  final bool isChecked;
  final String taskTile;
  final Function(bool?) onTap;
  final VoidCallback onLongTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongTap,
      onTap: () {
    
      },
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: onTap),
      title: Text(
        taskTile,
        style: TextStyle(
            fontSize: 20,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
    );
  }
}

  // void changeCheck(value) {
  //         setState(() {
  //           isChecked = value!;
  //         });
  //       }

