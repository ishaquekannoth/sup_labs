import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sup_labs_task/core/constants/constants.dart';
import 'package:sup_labs_task/core/themes/colors.dart';

class AppTheme {
  static String? primaryFont = GoogleFonts.roboto().fontFamily;
  static String? royalFont = GoogleFonts.bonheurRoyale().fontFamily;
  static String? secondaryFont = GoogleFonts.dancingScript().fontFamily;
  static ThemeData appTheme = ThemeData(
    fontFamily: primaryFont,
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle:
          WidgetStateProperty.all(const TextStyle(color: AppColors.white)),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.3,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: primaryFont,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
      thumbColor: Colors.white,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.grey,
      labelPadding: EdgeInsets.all(AppDefaults.padding),
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.grey,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(AppDefaults.padding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDefaults.borderRadius,
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(AppDefaults.padding),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDefaults.borderRadius,
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    primaryColor: AppColors.primaryColor,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.primaryColor),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secondaryColor),
    useMaterial3: true,
  );
}
