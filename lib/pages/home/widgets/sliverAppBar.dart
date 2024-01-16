// ignore_for_file: file_names, must_be_immutable, unused_local_variable, avoid_print, prefer_const_constructors, no_logic_in_create_state, unused_field
import 'dart:math';

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/build/chartBuilder.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:financas/pages/home/build/listBuilder.dart';
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
  late Future<void> _dataInitialization;
  late double a;
  late double b;

  Future<void> fetchData() async {
    print('fetch Data!');
    if (widget.appstate.chartLoadingState == true) {
      await Future.delayed(const Duration(seconds: 5));
      //
      a = 50;
      b = 200;
      widget.appstate.changeChartLoadingState();
    }
  }

  @override
  void initState() {
    print('SLIVERAPP BAR INICIADO');
    super.initState();
    _dataInitialization = fetchData();
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
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale:
                        Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: appstate.percent > 0.5
                    ? SizedBox(
                        key: const ValueKey(1),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Olá, Gustavo!',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Icon(Icons.keyboard_arrow_right_outlined,
                                  size: 30,
                                  color: rules.iconColors(
                                      currentBrightness, appstate.percent))
                            ],
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            key: const ValueKey(2),
                            width: MediaQuery.of(context).size.width - 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Seu saldo',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "R\$ 20.000,00",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
            centerTitle: true,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  appstate.changeChartLoadingState;
                  await fetchData();
                },
                icon: const Icon(Icons.remove_red_eye_outlined),
                color: rules.iconColors(currentBrightness, appstate.percent)),
            IconButton(
                onPressed: () {},
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
                      height: 200,
                      child: Observer(
                        builder: (_) {
                          return Skeletonizer(
                              enabled: appstate.chartLoadingState,
                              justifyMultiLineText: false,
                              ignoreContainers: true,
                              ignorePointers: false,
                              child: FutureBuilder(
                                  future: _dataInitialization,
                                  builder: (contex, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return ChartBuilder(
                                          appstate: appstate,
                                          building: appstate.chartLoadingState,
                                          maxSize: 100,
                                          entrada: 100,
                                          saida: 100);
                                    } else {
                                      return ChartBuilder(
                                          appstate: appstate,
                                          building: appstate.chartLoadingState,
                                          maxSize: 100,
                                          entrada: a,
                                          saida: b);
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
                  Skeletonizer(
                    enabled: false,
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListFinalBuilder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]))
      ],
    );
  }
}
