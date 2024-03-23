import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:do_it/Presentation/Add%20Tasks%20Screen/Widgets/add_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: Form(
            key: cubit.formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                [
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
                  const SizedBox(),
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
