import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:do_it/Util/Global Widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoItCubit, DoItStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var tasks=DoItCubit.get(context).doneTasks;
        var isDone=DoItCubit.get(context).isDone;
        return taskBuilder(
            tasks: tasks,
            isDone: isDone,

        );
      },
    );
  }
}
