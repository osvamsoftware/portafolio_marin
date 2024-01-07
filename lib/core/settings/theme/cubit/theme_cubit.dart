import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_marin/core/settings/preferences/preferences_config.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial(isDarkTheme: false));

  getIsDarkTheme() async {
    final bool isDark = Preferences.getThemeBrightness;
    emit(state.copyWith(isDarkTheme: isDark));
  }

  setIsDarkTheme(bool isDarked) async {
    Preferences.saveThemeBrightness(isDarked);
    final bool isDark = Preferences.getThemeBrightness;

    emit(state.copyWith(isDarkTheme: isDark));
  }
}
