import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_provider_event.dart';
part 'theme_provider_state.dart';

class ThemeProviderBloc extends Bloc<ThemeProviderEvent, ThemeProviderState> {
  static bool isDark (){
    return PlatformDispatcher.instance.platformBrightness == Brightness.dark  ; }
  ThemeProviderBloc() : super(isDark() ? DarkTheme() : LightTheme()){
   PlatformDispatcher.instance.onPlatformBrightnessChanged = () {
     add(
        SetThemeEvent(isDark() ? DarkTheme() : LightTheme())
      ); };
    on<ToggleThemeEvent>((event, emit) {
      state is LightTheme ? emit(DarkTheme()) : emit(LightTheme());
      }
    );
    on<SetThemeEvent>((event, emit) {
      emit(event.theme);
    });
    
  }
}
