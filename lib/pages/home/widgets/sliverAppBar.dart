// ignore_for_file: file_names, must_be_immutable, unused_local_variable, avoid_print, prefer_const_constructors, no_logic_in_create_state, unused_field, avoid_unnecessary_containers, non_constant_identifier_names
import 'dart:math';

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/build/barBuilder.dart';
import 'package:financas/pages/home/build/buttonBuilder.dart';
import 'package:financas/pages/home/build/chartBuilder.dart';
import 'package:financas/pages/home/build/listBuilder.dart';
import 'package:financas/pages/home/rules/chartUpdate.dart';
import 'package:financas/pages/home/rules/chartUpdate_v2.dart';
import 'package:financas/pages/home/rules/listUpdate.dart';
import 'package:financas/pages/home/rules/listUpdate_v2.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverAppBarApp extends StatefulWidget {
  BuildContext context;
  AppState appstate;
  String title;
  ScrollController scrollController;
  double percent;
  double expandedHeight;

  SliverAppBarApp({
    super.key,
    required this.context,
    required this.appstate,
    required this.title,
    required this.scrollController,
    required this.percent,
    required this.expandedHeight,
  });

  @override
  State<SliverAppBarApp> createState() {
    print('SLIVERAPP BAR CRIADO');
    return _SliverAppBarAppState();
  }
}

class _SliverAppBarAppState extends State<SliverAppBarApp> {
  //
  final rules = Rules();
  //
  late Future<void> _getChartValues;
  late Future<void> _getListValues;
  //
  late Map<String, dynamic> es;
  late List ls;
  late double randomValue;
  late PageController pageController;
  //
  final listUpdate = ListUpdate();
  final chartUpdate = ChartUpdate();
  //
  final chartUpdate_v2 = ChartUpdatev2();
  final listUpdate_v2 = ListUpdatev2();
  //

  Future<void> getListValues({
    required bool fontFilter,
    required Map range,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    //
    var defaultFilter = await rules.defautDateRange();
    var customFilter = range;
    //
    var finalFilter = fontFilter == false ? defaultFilter : range;
    var response = await listUpdate_v2.listUpdate(
      id: '64cfc4bcdd83f5737a40f71d',
      user: 'Teste',
      filter: finalFilter,
    );
    ls = response;
    widget.appstate.changeListLoadingState();
  }

  Future<void> getChartValues() async {
    if (widget.appstate.chartLoadingState == true) {
      await Future.delayed(const Duration(seconds: 1));
      //
      var response = await chartUpdate_v2.chartUpdate();
      es = {
        'Entrada': response['chart']['entrada']!,
        'Saida': response['chart']['saida']!
      };
      //
      widget.appstate.changeChartLoadingState();
    }
  }

  @override
  void initState() {
    print('SLIVERAPP BAR INICIADO');
    randomValue = Random().nextDouble() * 10000;
    pageController = PageController(
      viewportFraction: 0.25,
    );
    super.initState();
    _getListValues = getListValues(fontFilter: false, range: {});
    _getChartValues = getChartValues();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('SLIVERAPP BAR CONSTRUIDO');

    Random random = Random();
    BuildContext context = widget.context;
    AppState appstate = widget.appstate;
    String title = widget.title;
    ScrollController scrollController = widget.scrollController;
    double percent = widget.percent;
    double expandedHeight = widget.expandedHeight;

    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;

    final barBuilder = BarBuilder();
    final buttonBuilder = ButtonBuilder();
    //
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          collapsedHeight: 130,
          expandedHeight: expandedHeight,
          forceElevated: false,
          elevation: 0,
          pinned: true,
          floating: true,
          snap: false,
          shadowColor: Colors.transparent,
          backgroundColor: percent <= 1.0
              ? Color.lerp(Theme.of(context).colorScheme.background,
                  Theme.of(context).colorScheme.onPrimary, percent) as Color
              : Theme.of(context).colorScheme.onPrimary,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(top: 0, bottom: 20),
            title: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale:
                        Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: appstate.percent > 0.5
                    ? barBuilder.collapsedBar(
                        context: context,
                        rules: rules,
                        appstate: appstate,
                        randomValue: randomValue)
                    : barBuilder.expandedBar(
                        context: context,
                        rules: rules,
                        appstate: appstate,
                        randomValue: randomValue)),
            centerTitle: true,
          ),
          actions: [
            Observer(builder: (_) {
              return IconButton(
                  onPressed: () async {
                    appstate.changeChartLoadingState();
                    appstate.changeListLoadingState();
                    getChartValues();
                    getListValues(fontFilter: false, range: {});
                  },
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color: rules.iconColors(
                      currentBrightness, appstate.percent, context));
            }),
            IconButton(
                onPressed: () async {
                  chartUpdate.chartUpdate();
                },
                icon: const Icon(Icons.flag_outlined),
                color: rules.iconColors(
                    currentBrightness, appstate.percent, context)),
            IconButton(
                onPressed: () async {
                  rules.pickedDateRange(context);
                },
                icon: const Icon(Icons.person),
                color: rules.iconColors(
                    currentBrightness, appstate.percent, context))
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [
                  IconButton(
                    onPressed: () async {
                      var response = await rules.pickedDateRange(context);
                      appstate.changeListLoadingState();
                      await getListValues(
                        fontFilter: true,
                        range: response,
                      );
                    },
                    icon: Icon(Icons.add),
                    tooltip: 'Inserir',
                    style: ButtonStyle(
                        iconColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        iconSize: const MaterialStatePropertyAll(30),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                        backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.onBackground)),
                  )
                ],
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                      height: 250,
                      child: Observer(
                        builder: (_) {
                          return Skeletonizer(
                              enabled: appstate.chartLoadingState,
                              justifyMultiLineText: true,
                              ignoreContainers: true,
                              ignorePointers: true,
                              child: FutureBuilder(
                                  future: _getChartValues,
                                  builder: (contex, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                        return ChartBuilder(
                                            appstate: appstate,
                                            building:
                                                appstate.chartLoadingState,
                                            maxSize: 100,
                                            entrada: 1,
                                            saida: 1);
                                      case ConnectionState.done:
                                        return ChartBuilder(
                                            appstate: appstate,
                                            building:
                                                appstate.chartLoadingState,
                                            maxSize: 100,
                                            entrada: es['Entrada']!,
                                            saida: es['Saida']!);

                                      default:
                                        return Container();
                                    }
                                  }));
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 2,
                    ),
                  ),
                  Observer(builder: (_) {
                    return Skeletonizer(
                      enabled: appstate.listLoadingState,
                      justifyMultiLineText: true,
                      ignoreContainers: false,
                      ignorePointers: true,
                      child: FutureBuilder(
                        future: _getListValues,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return SizedBox(
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      child: ListTile(
                                        leading: const Icon(Icons.circle,
                                            color: Colors.green, size: 30),
                                        title: Text('',
                                            style:
                                                const TextStyle(fontSize: 17)),
                                        subtitle: Text(
                                          '',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    )),
                              );
                            case ConnectionState.done:
                              return SizedBox(
                                child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ListBuilder(
                                      listSize: ls.length,
                                      listValues: ls,
                                    )),
                              );
                            default:
                              return Container();
                          }
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ]))
      ],
    );
  }
}
