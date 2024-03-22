import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoItCubit, DoItStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Center(
            child: Text(
                'Settings Page',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
        );
      },
    );
  }
}
