
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:do_it/Util/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeLayout extends StatelessWidget
{
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<DoItCubit, DoItStates>(
      listener: (context, state)
      {

      },
      builder: (context, state)
      {
        DoItCubit cubit=DoItCubit.get(context);
        return Scaffold(
          key: cubit.scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton:ConditionalBuilder(
              condition: cubit.currentIndex==1||cubit.currentIndex==2,
              builder: (context)=>const SizedBox(),
              fallback: (context)=>
               FloatingActionButton(
                onPressed: ()
                {
                  Navigator.pushNamed(
                      context,
                      NamedRoutes.addTaskScreen,
                  );
                  // if (cubit.isBottomSheetShown)
                  // {
                  //   if (cubit.formKey.currentState!.validate())
                  //   {
                  //     cubit.insertToDataBase(
                  //       title: cubit.titleController.text,
                  //       time: cubit.timeController.text,
                  //       date: cubit.dateController.text,
                  //     );
                  //     cubit.isDone.add(false);
                  //   }
                  // } else
                  // {
                  //   cubit.scaffoldKey.currentState!.showBottomSheet(
                  //         (context) =>
                  //         Container(
                  //           color: Colors.white,
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Form(
                  //             key: cubit.formKey,
                  //             child: Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children:
                  //               [
                  //                 defaultFormField(
                  //                   controller: cubit.titleController,
                  //                   type: TextInputType.text,
                  //                   validate: (String?value)
                  //                   {
                  //                     if (value!.isEmpty) {
                  //                       return 'Title must not be empty';
                  //                     }
                  //                     return null;
                  //                   },
                  //                   label: 'Task Title',
                  //                   prefix: Icons.title,
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 15.0,
                  //                 ),
                  //                 defaultFormField(
                  //                   controller: cubit.timeController,
                  //                   type: TextInputType.datetime,
                  //                   onTap: () {
                  //                     showTimePicker(
                  //                       context: context,
                  //                       initialTime: TimeOfDay.now(),
                  //                     ).then((value) {
                  //                       cubit.timeController.text =
                  //                           value!.format(context);
                  //                     });
                  //                   },
                  //                   validate: (String?value) {
                  //                     if (value!.isEmpty) {
                  //                       return 'Time must not be empty';
                  //                     }
                  //                     return null;
                  //                   },
                  //                   label: 'Task Time',
                  //                   prefix: Icons.watch_later_outlined,
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 15.0,
                  //                 ),
                  //                 defaultFormField(
                  //                   controller: cubit.dateController,
                  //                   type: TextInputType.datetime,
                  //                   onTap: () {
                  //                     showDatePicker(
                  //                       context: context,
                  //                       initialDate: DateTime.now(),
                  //                       firstDate: DateTime.now(),
                  //                       lastDate: DateTime.parse('2030-12-30'),
                  //                     ).then((value) {
                  //                       cubit.dateController.text =
                  //                           DateFormat.yMMMd().format(value!);
                  //                     });
                  //                   },
                  //                   validate: (String?value) {
                  //                     if (value!.isEmpty) {
                  //                       return 'Date must not be empty';
                  //                     }
                  //                     return null;
                  //                   },
                  //                   label: 'Task Date',
                  //                   prefix: Icons.calendar_today,
                  //                 ),
                  //
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //   ).closed.then((value) {
                  //     cubit.changeBottomSheetState(
                  //         isShow: false,
                  //         icon: Icons.edit
                  //     );
                  //   });
                  //   cubit.changeBottomSheetState(
                  //     isShow: true,
                  //     icon: Icons.add,
                  //   );
                  // }
                },
                 child: Icon(
                  Icons.edit,
                ),
               ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 65,
            backgroundColor: Colors.white,
            color: Colors.teal,
            index: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeIndex(index);
            },
            items:
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  cubit.currentIndex == 0
                      ? const SizedBox(height: 0.0,)
                      : const Text(
                    'Tasks',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.white,
                  ),
                  cubit.currentIndex == 1
                      ? const SizedBox(height: 0.0,)
                      : const Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  cubit.currentIndex == 2
                      ? const SizedBox(height: 0.0,)
                      : const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


}



