import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:flutter/material.dart';

class NavBarItem extends StatelessWidget {

  final IconData icon;
  final String text;
  final int index;

   NavBarItem({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
   });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
         Icon(
          icon,
          color: Colors.white,
        ),
        DoItCubit.get(context).currentIndex == index
            ? const SizedBox(height: 0.0,)
            : Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
      ],
    );
  }
}
