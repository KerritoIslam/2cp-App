part of 'theme_provider_bloc.dart';

@immutable

abstract class ThemeProviderEvent {}
abstract class ToggleThemeEvent extends ThemeProviderEvent {}
abstract class SetThemeEvent extends ThemeProviderEvent {
  final ThemeProviderState theme;
  SetThemeEvent(this.theme);
}
