import 'package:do_it/Presentation/Add%20Tasks%20Screen/add_tasks_screen.dart';
import 'package:do_it/Presentation/Done%20Tasks%20Screen/done_tasks_screen.dart';
import 'package:do_it/Presentation/Home%20Screen/do_it_home.dart';
import 'package:do_it/Presentation/New%20Tasks%20Screen/new_tasks_screen.dart';
import 'package:do_it/Presentation/Settings%20Screen/settings_screen.dart';
import 'package:flutter/material.dart';

class NamedRoutes
{
  static const homeLayout='homeLayout';
  static const newTaskScreen='newTaskScreen';
  static const addTaskScreen='addTaskScreen';
  static const doneTaskScreen='doneTaskScreen';
  static const settingsScreen='settingsScreen';

}

class AppRoutes
{
  static const  homeLayout=HomeLayout();
  static const  newTaskScreen=NewTasksScreen();
  static const  addTaskScreen=AddTasksScreen();
  static const  doneTaskScreen=DoneTasksScreen();
  static const  settingsScreen=SettingsScreen();

  static Map <String,Widget Function(BuildContext context)>routes=
  {
    NamedRoutes.homeLayout:(context)=>AppRoutes.homeLayout,
    NamedRoutes.newTaskScreen:(context)=>AppRoutes.newTaskScreen,
    NamedRoutes.addTaskScreen:(context)=>AppRoutes.addTaskScreen,
    NamedRoutes.doneTaskScreen:(context)=>AppRoutes.doneTaskScreen,
    NamedRoutes.settingsScreen:(context)=>AppRoutes.settingsScreen,
  };
}