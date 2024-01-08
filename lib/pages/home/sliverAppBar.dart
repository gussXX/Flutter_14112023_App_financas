// ignore_for_file: file_names, must_be_immutable, unused_local_variable, avoid_print

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/chart.dart';
import 'package:financas/pages/home/rules/lists.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:financas/pages/home/stfListBuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    return _SliverAppBarAppState();
  }
}

class _SliverAppBarAppState extends State<SliverAppBarApp> {
  @override
  void initState() {
    print('ESTADO INICIADO');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext context = widget.context;
    AppState appstate = widget.appstate;
    String title = widget.title;
    ScrollController scrollController = widget.scrollController;
    double percent = widget.percent;
    double expandedHeight = widget.expandedHeight;

    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;
    final charthome = ChartHome();
    final rules = Rules();
    final listValues = ListValues();

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
                              const Icon(Icons.keyboard_arrow_right_outlined,
                                  size: 30, color: Colors.red)
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
                onPressed: () {},
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
                      child: charthome.barchat(
                          maxSize: 100, entrada: 5000.00, saida: 2000.00)),
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onBackground,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        )),
                  ),
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListFinalBuilder(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: const BoxDecoration(color: Colors.red),
                  )
                ],
              ),
            ),
          )
        ]))
      ],
    );
  }
}
