// ignore_for_file: avoid_print, prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/chart.dart';
import 'package:financas/pages/home/rules/lists.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThisSliverAppbar {
  Function? context;
  AppState? appstate;
  String? title;
  ScrollController? scrollController;
  double? percent;
  double? expandedHeight;
  Widget? listFinal;

  CustomScrollView custonScrollView({
    required BuildContext context,
    required AppState appstate,
    required String title,
    required ScrollController scrollController,
    required double percent,
    required double expandedHeight,
    required Widget listFinal
  }) {
    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;

    final charthome = ChartHome();
    final rules = Rules();
    final listValues = ListValues();

    ScrollController listScrollController = ScrollController();
    print('Re-build!');

    return CustomScrollView(
      controller: scrollController,
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
            titlePadding: EdgeInsets.only(top: 0, bottom: 20),
            title: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale:
                        Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: appstate.percent > 0.5
                    ? SizedBox(
                        key: ValueKey(1),
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
                                  color: rules.iconColors(currentBrightness, appstate.percent))
                            ],
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            key: ValueKey(2),
                            width: MediaQuery.of(context).size.width - 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
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
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(180, 20)),
                              alignment: Alignment.center,
                              elevation: MaterialStatePropertyAll(0),
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
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        controller: listScrollController,
                        itemBuilder: (context, index) {
                        return listFinal;
                      },),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.red),
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
