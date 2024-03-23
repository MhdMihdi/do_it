
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:do_it/Presentation/Home%20Screen/Widgets/home_widgets.dart';
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
      listener: (context, state) {},
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
          body: ConditionalBuilder(
              condition: state is! AppGetDataBaseState,
              builder:(context)=>
                   Center(
                     child: CircularProgressIndicator()
                   ),
              fallback: (context)=>
                   cubit.screens[cubit.currentIndex],
          ),
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
              NavBarItem(
                  icon: Icons.menu,
                  text: 'Tasks',
                  index: 0,
              ),
              NavBarItem(
                  icon: Icons.check_circle_outline,
                  text: 'Done',
                  index: 1,
              ),
              NavBarItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  index: 2,
              ),
            ],
          ),
        );
      },
    );
  }


}



