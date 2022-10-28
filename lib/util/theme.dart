import 'package:flutter/material.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF165ED3),
      onPrimary: Color(0xFFFFFFFF),
      onSecondary: Color(0xFFFFFFFF),
      secondary: Color(0xFF165ED3),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFFFFFFFF),
      color: Color(0xFFFFFFFF),
    ),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFFFAFAFD),
      color: Color(0xFFFAFAFD),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFFFFFFFF),
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusColor: const Color(0xFF165ED3),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF165ED3),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF808689),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF808689),
            ),
            borderRadius: BorderRadius.circular(8.0))),
    bottomAppBarColor: const Color(0xFFF0F3F8),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF0F3F8),
    ),
    navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: const Color(0xFFF0F3F8),
        backgroundColor: const Color(0xFFF0F3F8),
        indicatorColor: const Color(0xFFC2E7FF),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFF050505),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFF050505), fontWeight: FontWeight.w500))),
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        modalBackgroundColor: Color(0xFFF0F3F8)));

ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.w400),
    ),
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1B1B1D),
    scaffoldBackgroundColor: const Color(0xFF1B1B1D),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFA4C8FF),
      onPrimary: Color(0xFFC2E7FF),
      onSecondary: Color(0xFF292C30),
      secondary: Color(0xFF6799CB),
    ),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Color(0xFF1B1B1D),
      backgroundColor: Color(0xFF1B1B1D),
    ),
    cardTheme: const CardTheme(
      surfaceTintColor: Color(0xFF2B2B2D),
      color: Color(0xFF2B2B2D),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Color(0xFF1B1B1D),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF1B6098),
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusColor: const Color(0xFFA4C8FF),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFA4C8FF),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF7A8083),
            ),
            borderRadius: BorderRadius.circular(8.0)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF7A8083),
            ),
            borderRadius: BorderRadius.circular(8.0))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF292C30),
    ),
    bottomAppBarColor: const Color(0xFF292C30),
    navigationBarTheme: NavigationBarThemeData(
        surfaceTintColor: const Color(0xFF292C30),
        backgroundColor: const Color(0xFF292C30), //0xFF202122
        indicatorColor: const Color(0xFF014269),
        iconTheme: MaterialStateProperty.all(const IconThemeData(
          color: Color(0xFFE3E3E3),
        )),
        labelTextStyle: MaterialStateProperty.all(const TextStyle(
            color: Color(0xFFE3E3E3), fontWeight: FontWeight.w500))),
    bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        ),
        modalBackgroundColor: Color(0xFF292C30)));
