import 'package:do_it/Bloc/Tasks%20Cubit/tasks_cubit.dart';
import 'package:do_it/Bloc/Theme%20Cubit/theme_cubit.dart';
import 'package:do_it/Util/app_bloc_observer.dart';
import 'package:do_it/Util/app_router.dart';
import 'package:do_it/Util/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {

 WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  String?themeMode=await CacheHelper.getData(key:'themeMode');
  bool value=themeMode!.toLowerCase()=='true';
  debugPrint(themeMode);

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(mode: value));
}

class MyApp extends StatelessWidget {
  final bool?mode;
   const MyApp({
    super.key,
    this.mode,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..themeToggle(fromStorage: mode),
        ),
        BlocProvider(
          create: (context) => TasksCubit()..createDataBase(),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
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
                      centerTitle: false,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      )
                    ),
                    floatingActionButtonTheme: const FloatingActionButtonThemeData(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      elevation: 0.0,
                    ),
                    progressIndicatorTheme: const ProgressIndicatorThemeData(
                      color: Colors.teal,
                    ),
                    textTheme: TextTheme(
                        titleSmall: TextStyle(
                          fontSize:15.sp,
                          color: Colors.black,
                        ),
                        titleLarge: TextStyle(
                          fontSize: 30.0.sp,
                          color: Colors.white
                        ),
                        labelSmall: TextStyle(
                          fontSize: 14.0.sp,
                          color: Colors.grey
                        )
                    ),
                  ),
                  darkTheme: ThemeData(
                    useMaterial3: true,
                    scaffoldBackgroundColor: Colors.black12,
                    textTheme: TextTheme(
                        titleSmall: TextStyle(
                          fontSize:15.sp,
                          color: Colors.white,
                        ),
                        titleLarge: TextStyle(
                            fontSize: 30.0.sp,
                            color: Colors.white
                        ),
                        labelSmall: TextStyle(
                            fontSize: 14.0.sp,
                            color: Colors.white60
                        )
                    ),
                  ),
                  themeMode: ThemeCubit.get(context).themeSwitch?ThemeMode.dark:ThemeMode.light,
                );
              }
          );
        },
      ),
    );
  }
}

