import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final Function(String?)? onTap;

  CustomBottomSheet({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  String? taskName;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            right: 15,
            left: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (v) {
                taskName = v;
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
                onPressed: () {
                  onTap!(taskName);
                  Navigator.pop(context);
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
