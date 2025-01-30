part of 'theme_provider_bloc.dart';

@immutable

abstract class ThemeProviderEvent {}
class ToggleThemeEvent extends ThemeProviderEvent {}
class SetThemeEvent extends ThemeProviderEvent {
  final ThemeProviderState theme;
  SetThemeEvent(this.theme);
}
