import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


class DbMethods {

   Database?database;

   Future<Database> createDB()
   async
   {
     return  openDatabase(
       'todo.db',
       version: 1,
       onCreate: (database, version)
       {
         debugPrint('Database Created');
         database.execute(
             'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)'
         ).then((value) {
           debugPrint('Table Created');
         }).catchError((error) {
           debugPrint('Error when creating Table${error.toString()}');
         });
       },
       onOpen: (database)
       {

         debugPrint('Database Opened');
       },
     );
  }

   Future<List<Map<String, Object?>>> getDataFromDB(Database database) async
  {
    return await database.rawQuery('SELECT * FROM tasks');
  }

    Future insertToDataBase({
    required title,
    required time,
    required date}) async
  {
    await  database!.transaction((txn)
    {
      return txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")'
      ).then((value) {
        debugPrint('$value Inserted Successfully');
        getDataFromDB(database!);
      }).catchError((error) {
        debugPrint('Error when Insert New Record${error.toString()}');
      });
      });
    }


   Future<int> updateDataBase({
    required String status,
    required int id,
  })async
  {
    return await database!.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      [status, id],
    );
  }

   Future<int> deleteData({
    required int id,
  })async
  {
   return await database!.rawDelete(
      'DELETE FROM tasks WHERE id = ?',
      [id],
    );
  }

}