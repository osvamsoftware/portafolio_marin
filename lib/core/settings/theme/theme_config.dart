import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_marin/core/constants/colors.dart';

class CustomThemeData {
  final Color colorSeed;
  final bool isDarkMode;
  final BuildContext context;

  CustomThemeData({required this.colorSeed, required this.isDarkMode, required this.context});

  ThemeData getThemeData() {
    final newTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: isDarkMode ? themeColors.lightgrey : themeColors.blackGrey,
          displayColor: isDarkMode ? themeColors.lightgrey : themeColors.blackGrey,
        );
    return ThemeData(
      dialogBackgroundColor: Colors.grey.shade900,
      primaryIconTheme: const IconThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: themeColors.primaryBlue,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.red.shade400,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.white,
          surface: Colors.white,
          onSurface: Colors.grey.shade600),
      drawerTheme: DrawerThemeData(backgroundColor: isDarkMode ? themeColors.blackGrey : themeColors.lightgrey),
      primaryColor: themeColors.primaryBlue,
      hintColor: themeColors.secondaryBlue,
      fontFamily: GoogleFonts.mulish().fontFamily,
      textTheme: newTextTheme,
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        color: Colors.black,
      ),
      scaffoldBackgroundColor: isDarkMode ? Colors.black : themeColors.lightgrey,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: isDarkMode ? themeColors.blackGrey : themeColors.lightgrey,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: themeColors.primaryBlue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xCFCFCFCF),
      ),
    );
  }

  CustomThemeData copyWith({Color? colorSeed, bool? isDarkMode}) => CustomThemeData(
      colorSeed: colorSeed ?? this.colorSeed, isDarkMode: isDarkMode ?? this.isDarkMode, context: context);
}
