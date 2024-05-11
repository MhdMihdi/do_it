import 'package:do_it/Bloc/Tasks%20Cubit/tasks_cubit.dart';
import 'package:do_it/Presentation/Add%20Tasks%20Screen/Widgets/add_screen_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddTasksScreen extends StatelessWidget {
  const AddTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksStates>(
      listener: (context, state) {
        if(state is AppInsertDataBaseState)
        {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        TasksCubit cubit=TasksCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.teal,
              ),
              onPressed: ()
              {
                Navigator.pop(context);
              },
            ),
          ),
          body: Form(
            key: cubit.formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                [
                  Container(
                    width: 270.h,
                    height: 250.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/1.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(),
                  defaultFormField(
                    controller: cubit.titleController,
                    type: TextInputType.text,
                    validate: (String?value) {
                      if (value!.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                    label: 'Task Title',
                    prefix: Icons.title,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: cubit.timeController,
                    type: TextInputType.datetime,
                    onTap: () {
                      showTimePicker(
                        context: context,
                        barrierColor: Colors.teal,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        cubit.timeController.text =
                            value!.format(context);
                      });
                    },
                    validate: (String?value) {
                      if (value!.isEmpty) {
                        return 'Time is required';
                      }
                      return null;
                    },
                    label: 'Task Time',
                    prefix: Icons.watch_later_outlined,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: cubit.dateController,
                    type: TextInputType.datetime,
                    onTap: () {
                      showDatePicker(
                        context: context,
                        barrierColor: Colors.teal,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2030-12-30'),
                      ).then((value) {
                        cubit.dateController.text =
                            DateFormat.yMMMd().format(value!);
                      });
                    },
                    validate: (String?value) {
                      if (value!.isEmpty) {
                        return 'Date is required';
                      }
                      return null;
                    },
                    label: 'Task Date',
                    prefix: Icons.calendar_today,
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height/15,
                  ),
                  myButton(
                      title: 'add',
                      onPressed: ()
                      {
                        if (cubit.formKey.currentState!.validate())
                        {
                          cubit.insertToDataBase(
                            title: cubit.titleController.text,
                            time: cubit.timeController.text,
                            date: cubit.dateController.text,
                          );
                          //cubit.isDone.add(false);
                        }

                      }
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
