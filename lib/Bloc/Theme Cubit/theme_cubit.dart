import 'package:do_it/Util/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context)=>BlocProvider.of(context);

  bool themeSwitch=false;

  void themeToggle({bool? value,bool?fromStorage}) {

    if (fromStorage != null) {
     themeSwitch=fromStorage;
      emit(ThemeSwitchState());
    } else {
      themeSwitch = value!;
      CacheHelper.putData(key: 'themeMode', value: themeSwitch.toString())
          .then((value) {
        emit(ThemeSwitchState());
      });
    }
  }

}
