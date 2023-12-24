// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/body.dart';
import 'package:financas/pages/home/float_Button.dart';
import 'package:financas/pages/home/sliver_appbar.dart';
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

  late ScrollController scrollController;

  final app_state = AppState();
  final floatButton = FloatButton();
  final appbar = ThisppBar();
  final body = AppBody();
  final sliverappBar = ThisSliverAppbar();

 Color color= Color.fromARGB(255, 0, 139, 253);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
    ..addListener(() {
      print(scrollController.offset);

      var initial = 0;
      var end = 62;
      var percent = end/scrollController.offset;

      setState(() {
        color = Color.lerp(
          Color.fromARGB(255, 0, 139, 253), 
          Color.fromARGB(255, 253, 0, 0), 
          percent) as Color;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatButton.floatingActionButton(action: app_state.increment, context: context),
      //appBar: appbar.thisAppBar(context: context, pagetitle: widget.pageTitle),
      //body: body.singleChildScrollView(app_state: app_state),
      body: sliverappBar.custonScrollView(
        color: color,
        scrollController: scrollController,
        context: context,
        appstate: app_state, 
        title: widget.pageTitle),
    );
  }
}
