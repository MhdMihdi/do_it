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
  var themeMode=await CacheHelper.getData(key:'themeMode');
  debugPrint(themeMode);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          TasksCubit()
            ..createDataBase(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
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
                    appBarTheme: AppBarTheme(
                      backgroundColor: Colors.teal,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      elevation: 0.0,
                      centerTitle: false,
                      titleTextStyle: TextStyle(
                        fontSize: 30.0.sp,
                        color: Colors.white
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
                    scaffoldBackgroundColor: Colors.black,
                  ),
                  themeMode: ThemeCubit.get(context).themeSwitch==false?ThemeMode.light:ThemeMode.dark,
                );
              }
          );
        },
      ),
    );
  }
}

