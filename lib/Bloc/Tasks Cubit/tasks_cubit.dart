
// ignore_for_file: avoid_print

import 'package:do_it/Data/db_methods.dart';
import 'package:do_it/Util/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';


part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksStates>
{
  TasksCubit() : super(AppInitialState());

  static TasksCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;
   DbMethods db=DbMethods();
  List<Widget>screens =
  [
    AppRoutes.newTaskScreen,
    AppRoutes.doneTaskScreen,
    AppRoutes.settingsScreen,
  ];

  List<String>titles =
  [
    'New Tasks',
    'Done Tasks',
    'Settings',
  ];

  //Database?database;

  List<Map>newTasks=[];
  List<Map>doneTasks=[];

  //bool isBottomSheetShown = false;

  //IconData fabIcon = Icons.edit;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  List<bool>isDone=[];
  
  void changeIndex(int index)
  {
    currentIndex =index;
    emit(AppChangeBottomNavBarState());
  }

  createDataBase()
  {
    db.createDB().then((value){
      db.database=value;
      getDataFromDataBase(db.database!);
      emit(AppCreateDataBaseState());
    });
  }

  Future insertToDataBase({
    required title,
    required time,
    required date}) async
  {
    db.insertToDataBase(
        title: title,
        time: time,
        date: date
    ).then((value) {
     emit(AppInsertDataBaseState());
     getDataFromDataBase(db.database!);
    });
  }

  void getDataFromDataBase(Database database)
  {
      newTasks=[];
      doneTasks=[];
    emit(AppGetDataBaseLoadingState());
    db.getDataFromDB(database).then((value) {
      for (var element in value)
      {
        isDone.add(false);
      }

      for (var element in value)
      {
       if(element['status']=='new')
       {
         newTasks.add(element);

       } else if(element['status']=='done')
       {
         doneTasks.add(element);
       }
      }
      emit(AppGetDataBaseState());
    });
  }


  void updateDataBase({
    required String status,
    required int id,
   })
  {
    db.updateDataBase(
        status: status,
        id: id
    ).then((value){
      getDataFromDataBase(db.database!);
      emit(AppUpdateDataBaseState());
    });
  }

  void deleteData({
    required int id,
   })
  {
    db.deleteData(id: id).then((value) {
      getDataFromDataBase(db.database!);
      emit(AppDeleteDataBaseState());
    });
  }


  
}
