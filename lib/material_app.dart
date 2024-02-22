import 'package:financas/pages/home/homeapp.dart';
import 'package:financas/pages/home/widgets/insertPage.dart';
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
      initialRoute: '/',
      routes:  {
        '/': (context) => const HomeApp(
        pageTitle: 'App de finanças',
      ),
        '/insertPage': (context) => const InsertPage(),
      },
    );
  }
}


//Theme.of(context).primaryColor