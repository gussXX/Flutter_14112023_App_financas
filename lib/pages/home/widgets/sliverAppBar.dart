import 'package:financas/mobX/app_state.dart';
//
import 'package:financas/pages/home/build/barBuilder.dart';
import 'package:financas/pages/home/build/chartBuilder.dart';
import 'package:financas/pages/home/build/listBuilder.dart';
//
import 'package:financas/pages/home/rules/chartUpdate.dart';
import 'package:financas/pages/home/rules/listUpdate.dart';
//
import 'package:financas/pages/home/rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliverAppBarApp extends StatefulWidget {
  final BuildContext context;
  final AppState appstate;
  final String title;
  final ScrollController scrollController;
  final double percent;
  final double expandedHeight;

  const SliverAppBarApp({
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
  //
  final rules = Rules();
  //
  late Future<void> _getChartValues;
  late Future<void> _getListValues;
  //
  late Map<String, double> chartObject;
  late List ls;
  //
  late double randomValue;
  late double balance;
  late Map finalFilter;
  late String textRange;
  //
  late PageController pageController;
  //
  final chartUpdate = ChartUpdate();
  final listUpdate = ListUpdate();
  //
  Future<void> dateFormat() async {
    await initializeDateFormatting('pt_BR', null);
  }

  Future<void> getListValues({
    required bool fontFilter,
    required Map range,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    //
    var defaultFilter = await rules.defautDateRange();
    //
    finalFilter = fontFilter == false ? defaultFilter : range;
    //
    try {
      var response = await listUpdate.listUpdate(
        id: '65f8fe787112651c87dca4b9',
        user: 'Teste',
        filter: finalFilter,
      );
      ls = response;
    } catch (error) {
      ls = [];
    }
    await Future.delayed(const Duration(milliseconds: 500));
    widget.appstate.changeListLoadingState();
  }

  Future<void> getChartValues({
    required bool fontFilter,
    required Map range,
  }) async {
    if (widget.appstate.chartLoadingState == true) {
      await Future.delayed(const Duration(milliseconds: 500));
      //
      var defaultFilter = await rules.defautDateRange();
      //
      finalFilter = fontFilter == false ? defaultFilter : range;
      //
      var response = await chartUpdate.chartUpdate(
        id: '65f8fe787112651c87dca4b9',
        user: 'Teste',
        filter: finalFilter,
      );
      //
      chartObject = {
        'Entrada': response['entrada'],
        'Saida': response['saida']
      };
      balance = response['entrada'] - response['saida'];
      //
      await Future.delayed(const Duration(milliseconds: 500));
      widget.appstate.getBalance(balance);
      widget.appstate.changeChartLoadingState();
    }
  }

  @override
  void initState() {
    initializeDateFormatting();
    pageController = PageController(
      viewportFraction: 0.25,
    );
    super.initState();
    _getListValues = getListValues(fontFilter: false, range: {});
    _getChartValues = getChartValues(fontFilter: false, range: {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext context = widget.context;
    AppState appstate = widget.appstate;
    double percent = widget.percent;
    double expandedHeight = widget.expandedHeight;

    Brightness currentBrightness = MediaQuery.of(context).platformBrightness;

    final barBuilder = BarBuilder();
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
                  return FadeTransition(
                    opacity:
                        Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: appstate.percent > 0.5
                    ? Observer(builder: (_) {
                        return barBuilder.collapsedBar(
                          context: context,
                          rules: rules,
                          appstate: appstate,
                          balance: appstate.balance,
                        );
                      })
                    //
                    : Observer(
                        key: UniqueKey(),
                        builder: (_) {
                          return barBuilder.expandedBar(
                            context: context,
                            rules: rules,
                            appstate: appstate,
                            balance: appstate.balance,
                          );
                        },
                      )),
            centerTitle: false,
          ),
          actions: [
            Observer(builder: (_) {
              return IconButton(
                  onPressed: () async {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                  color: rules.iconColors(
                      currentBrightness, appstate.percent, context));
            }),
            IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.flag_outlined),
                color: rules.iconColors(
                    currentBrightness, appstate.percent, context)),
            IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.person),
                color: rules.iconColors(
                    currentBrightness, appstate.percent, context))
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Divider(
              color: Theme.of(context).colorScheme.tertiary,
              height: 1,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () async {
                        var response = await rules.pickedDateRange(context);
                        if (response.isNotEmpty) {
                          //
                          appstate.changeListLoadingState();
                          appstate.changeChartLoadingState();
                          //
                          await getChartValues(
                            fontFilter: true,
                            range: response,
                          );
                          //
                          await getListValues(
                            fontFilter: true,
                            range: response,
                          );
                        }
                      },
                      icon: const Icon(Icons.calendar_month_outlined),
                      tooltip: 'Filtrar por data',
                      style: ButtonStyle(
                          iconColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          iconSize: const MaterialStatePropertyAll(30),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.onBackground)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.filter_alt_rounded),
                        tooltip: 'Filtrar por tipo',
                        style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary),
                            iconSize: const MaterialStatePropertyAll(30),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onBackground))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.list),
                        tooltip: 'Relatorios',
                        style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary),
                            iconSize: const MaterialStatePropertyAll(30),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onBackground))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.timelapse_rounded),
                        tooltip: 'Graficos',
                        style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary),
                            iconSize: const MaterialStatePropertyAll(30),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onBackground))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.settings),
                        tooltip: 'Configurações',
                        style: ButtonStyle(
                            iconColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.primary),
                            iconSize: const MaterialStatePropertyAll(30),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onBackground))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: null,
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        tooltip: 'Ver mais',
                        style: ButtonStyle(
                          iconColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary),
                          iconSize: const MaterialStatePropertyAll(30),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                        )),
                  ),
                ],
              )),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 1,
                  ),
                ),
                Observer(builder: (_) {
                  return Skeletonizer(
                      enabled: appstate.chartLoadingState,
                      justifyMultiLineText: true,
                      ignoreContainers: true,
                      ignorePointers: true,
                      child: FutureBuilder(
                          future: _getChartValues,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Center(
                                  child: Text(
                                    "_____________________",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                );
                              case ConnectionState.done:
                                return Center(
                                  child: Text(
                                    // "${finalFilter}" +
                                    rules.getMonths(finalFilter),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                );
                              default:
                                return Container();
                            }
                          }));
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 1,
                  ),
                ),
                Observer(
                  builder: (_) {
                    return Skeletonizer(
                      enabled: appstate.chartLoadingState,
                      justifyMultiLineText: true,
                      ignoreContainers: true,
                      ignorePointers: true,
                      child: FutureBuilder(
                        future: _getChartValues,
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return SizedBox(
                                height: 250,
                                child: ChartBuilder(
                                  appstate: appstate,
                                  building: appstate.chartLoadingState,
                                  maxSize: 100,
                                  entrada: 1,
                                  saida: 1,
                                ),
                              );
                            case ConnectionState.done:
                              return SizedBox(
                                height: 250,
                                child: ChartBuilder(
                                  appstate: appstate,
                                  building: appstate.chartLoadingState,
                                  maxSize: 100,
                                  entrada: chartObject['Entrada']!,
                                  saida: chartObject['Saida']!,
                                ),
                              );
                            default:
                              return Container();
                          }
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 1,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    child: const ListTile(
                                      leading: Icon(Icons.circle,
                                          color: Colors.green, size: 30),
                                      title: Text('',
                                          style: TextStyle(fontSize: 17)),
                                      subtitle: Text(
                                        '',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  )),
                            );
                          case ConnectionState.done:
                            return SizedBox(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
          )
        ]))
      ],
    );
  }
}

                // KeepAliveFutureBuilder(
                //       future: _getListValues,
                //       builder: (context, snapshot) {
                //         switch (snapshot.connectionState) {
                //           case ConnectionState.waiting:
                //             return SizedBox(
                //               child: Padding(
                //                   padding: EdgeInsets.all(8.0),
                //                   child: Card(
                //                     elevation: 0,
                //                     color: Theme.of(context)
                //                         .colorScheme
                //                         .onBackground,
                //                     child: ListTile(
                //                       leading: const Icon(Icons.circle,
                //                           color: Colors.green, size: 30),
                //                       title: Text('',
                //                           style: const TextStyle(fontSize: 17)),
                //                       subtitle: Text(
                //                         '',
                //                         style: const TextStyle(fontSize: 14),
                //                       ),
                //                     ),
                //                   )),
                //             );
                //           case ConnectionState.done:
                //             return SizedBox(
                //               child: Padding(
                //                   padding: EdgeInsets.all(8.0),
                //                   child: ListBuilder(
                //                     listSize: ls.length,
                //                     listValues: ls,
                //                   )),
                //             );
                //           default:
                //             return Container();
                //         }
                //       },
                //     )