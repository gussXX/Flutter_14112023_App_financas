import 'package:flutter/material.dart';

class Tema {
  ThemeData lightMode() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 24),
          
          titleLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14)
            
            ),
      colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xff325D55),
          secondary: const Color.fromARGB(255, 243, 243, 243),
          seedColor: Colors.purple.shade100,
          background: Colors.grey.shade100,
          brightness: Brightness.light),
    );
  }

  ThemeData darkMode() {
    return ThemeData(
      useMaterial3: true,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 24),
          
          titleLarge: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 14)
            
            ),
      colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xff325D55),
          secondary: const Color.fromARGB(255, 243, 243, 243),
          seedColor: Colors.deepPurpleAccent,
          background: const Color(0xff262626),
          brightness: Brightness.dark),
    );
  }
}
