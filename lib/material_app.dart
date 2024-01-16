import 'package:financas/pages/home/homeApp.dart';
import 'package:financas/theme/theme.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().lightMode(),
      darkTheme: Tema().darkMode(),
      themeMode: ThemeMode.system,
      home: HomeApp(
        pageTitle: 'App de finanças', 
        ),
    );
  }
}


//Theme.of(context).primaryColor