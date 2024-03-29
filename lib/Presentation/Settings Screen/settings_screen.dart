import 'package:do_it/Bloc/Theme%20Cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ThemeCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              Text(
                'Theme',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Switch(
                value: cubit.themeSwitch,
                activeColor: Colors.teal,
                inactiveThumbColor: Colors.teal.shade700,
                onChanged: (value)
                {
                   cubit.themeToggle(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
