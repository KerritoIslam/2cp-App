import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_provider_event.dart';
part 'theme_provider_state.dart';

class ThemeProviderBloc extends Bloc<ThemeProviderEvent, ThemeProviderState> {
  BuildContext context;
  static bool isDark (BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  ThemeProviderBloc({required this.context}) : super(isDark(context) ? DarkTheme() : LightTheme()){
    
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightTheme) {
        emit(DarkTheme());
      } else {
        emit(LightTheme());
      }
    });
    on<SetThemeEvent>((event, emit) {
      emit(event.theme);
    });
    
  }
}
