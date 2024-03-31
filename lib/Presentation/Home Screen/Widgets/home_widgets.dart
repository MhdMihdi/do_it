import 'package:do_it/Bloc/Tasks%20Cubit/tasks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarItem extends StatelessWidget {

  final IconData icon;
  final String text;
  final int index;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksStates>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Icon(
              icon,
              color: Colors.white,
            ),
            TasksCubit
                .get(context)
                .currentIndex == index
                ? const SizedBox()
                : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
