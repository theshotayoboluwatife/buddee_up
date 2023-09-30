import 'package:flutter/material.dart';
import 'text_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme =
  ThemeData(
    // primarySwatch: Colors.green,

      brightness: Brightness.light,
      textTheme: CustomTextTheme.customTextTheme,
      appBarTheme: const AppBarTheme(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme:
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
      primarySwatch:  const MaterialColor(0xFF006E33, <int, Color>{
        50: Color(0x1A006E33),
        100: Color(0x33006E33),
        200: Color(0x4D006E33),
        300: Color(0x66006E33),
        400: Color(0x80006E33),
        500: Color(0xFF006E33),
        600: Color(0x99006E33),
        700: Color(0xB3006E33),
        800: Color(0xCC006E33),
        900: Color(0xE6006E33),
      })

  );


  static ThemeData darkTheme =
  ThemeData(
    //  primarySwatch:Colors.green,
      textTheme: CustomTextTheme.customTextTheme,
      appBarTheme: const AppBarTheme(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      primarySwatch:  const MaterialColor(0xFF006E33, <int, Color>{
        50: Color(0x1A006E33),
        100: Color(0x33006E33),
        200: Color(0x4D006E33),
        300: Color(0x66006E33),
        400: Color(0x80006E33),
        500: Color(0xFF006E33),
        600: Color(0x99006E33),
        700: Color(0xB3006E33),
        800: Color(0xCC006E33),
        900: Color(0xE6006E33),
      })
  );

  static ThemeData onBoardTheme =
  ThemeData(
    //primarySwatch: Colors.green,
      brightness: Brightness.light,
      textTheme: CustomTextTheme.customTextTheme,
      appBarTheme: const AppBarTheme(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      elevatedButtonTheme:
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      primarySwatch:  const MaterialColor(0xFF006E33, <int, Color>{
        50: Color(0x1A006E33),
        100: Color(0x33006E33),
        200: Color(0x4D006E33),
        300: Color(0x66006E33),
        400: Color(0x80006E33),
        500: Color(0xFF006E33),
        600: Color(0x99006E33),
        700: Color(0xB3006E33),
        800: Color(0xCC006E33),
        900: Color(0xE6006E33),
      })
  );



}
