// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_cubit.dart';

sealed class ThemeState {
  final bool isDarkTheme;

  ThemeState({required this.isDarkTheme});

  ThemeState copyWith({
    bool? isDarkTheme,
  });
}

final class ThemeInitial extends ThemeState {
  ThemeInitial({required super.isDarkTheme});

  @override
  ThemeState copyWith({bool? isDarkTheme}) => ThemeInitial(isDarkTheme: isDarkTheme ?? this.isDarkTheme);
}
