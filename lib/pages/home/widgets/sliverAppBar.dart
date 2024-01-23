// ignore_for_file: file_names, must_be_immutable, unused_local_variable, avoid_print, prefer_const_constructors, no_logic_in_create_state, unused_field
import 'dart:math';

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/build/barBuilder.dart';
import 'package:financas/pages/home/build/chartBuilder.dart';
import 'package:financas/pages/home/build/listBuilder.dart';
import 'package:financas/pages/home/rules/chartUpdate.dart';
import 'package:financas/pages/home/rules/listUpdate.dart';
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
  late Future<void> _getChartValues;
  late Future<void> _getListValues;
  //
  late Map<String, double> es;
  late Map<String, double> esAPI;
  late double randomValue;
  //
  late List ls;
  //
  final listUpdate = ListUpdate();
  final chartUpdate = ChartUpdate();

  Future<void> getListValues() async {
    await Future.delayed(const Duration(seconds: 5));
    ls = await listUpdate.listUpdate();
    widget.appstate.changeListLoadingState();
  }

  Future<void> getChartValues() async {
    double randoA = Random().nextDouble() * 10000;
    double randoB = Random().nextDouble() * 10000;
    print('Dados do GRAFICO recebidos');

    if (widget.appstate.chartLoadingState == true) {
      await Future.delayed(const Duration(seconds: 5));
      //
      esAPI = await chartUpdate.chartUpdate();
      es = {'Entrada': randoA, 'Saida': randoB};
      widget.appstate.changeChartLoadingState();
    }
  }

  @override
  void initState() {
    print('SLIVERAPP BAR INICIADO');
    randomValue = Random().nextDouble() * 10000;
    super.initState();
    _getChartValues = getChartValues();
    _getListValues = getListValues();
  }

  @override
  void dispose() {
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

    final rules = Rules();
    final barBuilder = BarBuilder();

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
                  Theme.of(context).colorScheme.primary, percent) as Color
              : Theme.of(context).colorScheme.primary,
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
                      )
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
                    getListValues();
                  },
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color: rules.iconColors(currentBrightness, appstate.percent));
            }),
            IconButton(
                onPressed: () async {
                  chartUpdate.chartUpdate();
                },
                icon: const Icon(Icons.flag_outlined),
                color: rules.iconColors(currentBrightness, appstate.percent)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                color: rules.iconColors(currentBrightness, appstate.percent))
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              fixedSize:
                                  const MaterialStatePropertyAll(Size(180, 20)),
                              alignment: Alignment.center,
                              elevation: const MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                            child: Text('12/Fev | 20/Mar',
                                style: Theme.of(context).textTheme.titleLarge),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.onPrimary,
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
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return ChartBuilder(
                                          appstate: appstate,
                                          building: appstate.chartLoadingState,
                                          esAPI: esAPI,
                                          maxSize: 100,
                                          entrada: 1,
                                          saida: 1);
                                    } else {
                                      return ChartBuilder(
                                          appstate: appstate,
                                          building: appstate.chartLoadingState,
                                          maxSize: 100,
                                          esAPI: esAPI,
                                          entrada: es['Entrada']!,
                                          saida: es['Saida']!);
                                    }
                                  }));
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.onPrimary,
                      height: 2,
                    ),
                  ),
                  Observer(
                    builder: (_) {
                      return Text('Valor = ${appstate.value}');
                    },
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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return SizedBox(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ListBuilder(
                                    listSize: 0,
                                    listValues: const [],
                                  )),
                            );
                          } else {
                            return SizedBox(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ListBuilder(
                                    listSize: ls.length,
                                    listValues: ls,
                                  )),
                            );
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
