// ignore_for_file: non_constant_identifier_names

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/float_Button.dart';
import 'package:flutter/material.dart';
import 'package:financas/pages/home/appbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with WidgetsBindingObserver {
  final app_state = AppState();
  final floatButton = FloatButton();
  final appbar = ThisppBar();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatButton.floatingActionButton(
          action: app_state.increment, colors: Colors.red),
      appBar: appbar.thisAppBar(context: context, pagetitle: widget.pageTitle),
      body: Center(
        child: Observer(
          builder: (_) {
            return Text('Valor = ${app_state.value}');
          },
        ),
      ),
    );
  }
}
