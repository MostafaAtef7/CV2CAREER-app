import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  ThemeData lightmode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.black,
    ),
  );
  ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xff414141),
      secondary: Colors.white,
    ),
  );
  ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.black,
    ),
  );
  void changeThemetoLight() {
    themeData = lightmode;
    emit(ThemeLightSuccess());
  }

  void changeThemetoDark() {
    themeData = darkMode;
    emit(ThemeDarkSuccess());
  }
}
