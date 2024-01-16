// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors, must_be_immutable

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/widgets/floatButton.dart';
import 'package:financas/pages/home/rules/lists.dart';
import 'package:financas/pages/home/widgets/sliverAppBar.dart';
import 'package:flutter/material.dart';
import 'package:financas/pages/login/appbar.dart';
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

class _HomeAppState extends State<HomeApp>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late ScrollController scrollController;
  late AnimationController animationController;

  final app_state = AppState();
  final floatButton = FloatButton();
  final appbar = ThisppBar();

  double sliver_appbar_size = 300;
  double finalPercent = 0;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.forward();

    scrollController = ScrollController()
      ..addListener(() {
        var initial = 0;
        var end = 62;
        double percent = (scrollController.offset) / (sliver_appbar_size - 70);
        app_state.percent = percent;
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        floatingActionButton: floatButton.floatingActionButton(
            action: app_state.increment, context: context),
        //
        body: SliverAppBarApp(
          expandedHeight: sliver_appbar_size,
          percent: app_state.percent,
          scrollController: scrollController,
          context: context,
          appstate: app_state,
          title: widget.pageTitle,
        ),
      );
    });
  }
}
