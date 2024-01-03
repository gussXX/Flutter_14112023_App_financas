// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors, must_be_immutable

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/body.dart';
import 'package:financas/pages/home/float_Button.dart';
import 'package:financas/pages/home/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:financas/pages/home/appbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

      //appBar: appbar.thisAppBar(context: context, pagetitle: widget.pageTitle),
      //body: body.singleChildScrollView(app_state: app_state),

class HomeApp extends StatefulWidget {

  HomeApp({super.key, required this.pageTitle});

  String pageTitle;
  @override
  State<HomeApp> createState() {
    return _HomeAppState();
  }
}

class _HomeAppState extends State<HomeApp> with WidgetsBindingObserver {

  late ScrollController scrollController;

  final app_state = AppState();
  final floatButton = FloatButton();
  final appbar = ThisppBar();
  final body = AppBody();
  final sliverappBar = ThisSliverAppbar();

  double sliver_appbar_size = 120;
  double finalPercent = 0;

  @override
  void initState() {

    super.initState();

    scrollController = ScrollController()
    ..addListener(() {

      var initial = 0;
      var end = 62;
      double percent = scrollController.offset/sliver_appbar_size;

      setState(() {
        finalPercent = percent;
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
      body: sliverappBar.custonScrollView(
        expandedHeight: sliver_appbar_size,
        percent: finalPercent,
        scrollController: scrollController,
        context: context,
        appstate: app_state, 
        title: widget.pageTitle),
    );
  }
}
