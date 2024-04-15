part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeDarkSuccess extends ThemeState {}

final class ThemeLightSuccess extends ThemeState {}
