import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'screens/tasks_screen.dart';
void main() {
  runApp( 

     ChangeNotifierProvider(
       create:((context) => TasksList()),
       child: MaterialApp(
        home: TasksScreen(),
     
         ),
     )
  );
  
}

