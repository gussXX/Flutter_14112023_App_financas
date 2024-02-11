import 'package:flutter/material.dart';

class Tema {
  ThemeData lightMode() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        //
        bodySmall: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff004443),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        //
        bodyMedium: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 20),
        //
        bodyLarge: TextStyle(
          fontFamily: 'Didact',
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontSize: 30,
          //
        ),
        //
        titleSmall: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        //
        titleMedium: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff004443),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        //
        titleLarge: TextStyle(
            fontFamily: 'Didact',
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      // ==========================================
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xfff2f2f2),
        brightness: Brightness.light,
        //
        primary: const Color(0xff004443),
        onPrimary: const Color(0xff004443),
        //
        secondary: const Color.fromARGB(255, 243, 243, 243),
        onSecondary: null,
        //
        tertiary: const Color(0xff7e7e7e),
        onTertiary: null,
        //
        inverseSurface: const Color(0xff333333),
        surface: const Color(0xfff2f2f2),
        // BACKGROUND COLOR
        background: const Color(0xffECEFF1),
        onBackground: const Color(0xffFFFFFF),
        //
      ),
    );
  }

  ThemeData darkMode() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        //
        bodySmall: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff39ff14),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 10),
        //
        bodyMedium: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 20),
        //
        bodyLarge: TextStyle(
          fontFamily: 'Didact',
          color: Colors.white,
          fontStyle: FontStyle.normal,
          fontSize: 30,
          //
        ),
        //
        titleSmall: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 10),
        //
        titleMedium: TextStyle(
            fontFamily: 'Didact',
            color: Color(0xff39ff14),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        //
        titleLarge: TextStyle(
            fontFamily: 'Didact',
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xfff2f2f2),
        brightness: Brightness.dark,
        //
        primary: const Color(0xff90ff17),
        onPrimary: const Color(0xff071104),
        //
        secondary: const Color.fromARGB(255, 243, 243, 243),
        onSecondary: null,
        //
        tertiary: const Color(0xff7e7e7e),
        onTertiary: null,
        //
        surface: const Color(0xff333333),
        inverseSurface: const Color(0xfff2f2f2),
        // BACKGROUND COLOR
        background: const Color(0xff121212),
        onBackground: const Color.fromARGB(157, 49, 49, 49),
        //
      ),
    );
  }
}


/// BACKUPS DE CORES
/// 
/// primary: const Color(0xff325D55),