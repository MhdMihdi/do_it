import 'package:do_it/Bloc/Theme%20Cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=ThemeCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              InkWell(
                onTap: (){

                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                        Icons.color_lens,
                        color: Colors.teal,
                        size: 50.0,
                    ),
                    Column(
                      children: [
                        Text(
                          'Theme',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          cubit.themeSwitch==false?'Light':'Dark',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Switch(
                        value: cubit.themeSwitch,
                        activeColor: Colors.teal,
                        inactiveTrackColor: Colors.white,
                        //activeTrackColor: Colors.black12,
                        inactiveThumbColor: Colors.teal.shade700,
                        onChanged: (value)
                        {
                           cubit.themeToggle(value: value);

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
