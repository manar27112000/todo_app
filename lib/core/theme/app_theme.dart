import 'package:flutter/material.dart';

class AppTheme{
  static const Color lightPrimaryColor =Color(0xFF5D9CEC);
  static const Color scaffoldBackgroundColor =Color(0xFFDFECDB);
  static const Color grayColor =Color(0xFFC8C9CB);
  static final ThemeData lightTheme= ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: lightPrimaryColor,
    primary:lightPrimaryColor,
      onPrimary: Colors.white
    ),
    useMaterial3: false,
    primaryColor: lightPrimaryColor,
    appBarTheme:  const AppBarTheme(
        elevation: 4,
        backgroundColor: lightPrimaryColor,
        titleTextStyle: TextStyle(
        fontSize: 18,color: Colors.white,
        fontWeight: FontWeight.bold,

      )

  ),
    scaffoldBackgroundColor:scaffoldBackgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: lightPrimaryColor,
      unselectedItemColor:grayColor,
    ),
    cardTheme: const CardTheme(
    color: Colors.white,
      elevation: 10
  ),
    textTheme: const TextTheme(
        labelMedium: TextStyle(
          fontSize: 18,
          color: lightPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
      fontSize: 14,
      color: grayColor,
      fontWeight: FontWeight.bold,
    ),
      headlineMedium: TextStyle(fontWeight: FontWeight.bold,
          color:Colors.black87,
          fontSize: 18 )

    )
  );

}