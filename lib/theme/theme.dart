import 'package:flutter/material.dart';

class Tema {
  ThemeData lightMode() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 20),
          bodyLarge: TextStyle(
            color: Colors.white,
              fontWeight: FontWeight.bold,
            fontSize: 24),
          
          titleLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleMedium: TextStyle(
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 10),
            
            ),
      colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xff325D55),
          secondary: const Color.fromARGB(255, 243, 243, 243),
          tertiary: const Color(0xff77A49B),

          onPrimary: const Color(0xffD9D9D9),

          seedColor: Colors.purple.shade100,
          background: Colors.grey.shade100,
          onBackground: Colors.white,
          brightness: Brightness.light),

      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(180, 20)),
        alignment: Alignment.center,
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          Color(0xffD9D9D9),
        ),
      )),
    );
  }

  ThemeData darkMode() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontSize: 20),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 24),
          
          titleLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14),
        titleMedium: TextStyle(
            color: Color(0xff325D55),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 10),
            
            ),
      colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xff325D55),
          secondary: const Color.fromARGB(255, 243, 243, 243),
          tertiary: const Color(0xff77A49B),

          onPrimary: const Color.fromARGB(255, 105, 105, 105),

          seedColor: Colors.deepPurpleAccent,
          background: const Color(0xff262626),
          onBackground: const Color.fromARGB(157, 49, 49, 49),
          brightness: Brightness.dark),
    );
  }
}
