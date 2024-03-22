import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:do_it/Util/app_bloc_observer.dart';
import 'package:do_it/Util/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoItCubit()..createDataBase(),
      child: BlocConsumer<DoItCubit, DoItStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: NamedRoutes.homeLayout,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  elevation: 0.0,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0
                  )
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                elevation: 0.0,
              ),
            ),
          );
        },
      ),
    );
  }
}

