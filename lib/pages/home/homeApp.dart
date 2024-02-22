import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/rules/insertUpdate.dart';
import 'package:financas/pages/home/widgets/floatButton.dart';
import 'package:financas/pages/home/widgets/sliverappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key, required this.pageTitle});

  final String pageTitle;
  @override
  State<HomeApp> createState() {
    return _HomeAppState();
  }
}

class _HomeAppState extends State<HomeApp>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  //
  late ScrollController scrollController;
  late AnimationController animationController;
  //
  late TextEditingController controllerParcelas;
  late TextEditingController controllerValor;
  //
  final appstate = AppState();
  final floatButton = FloatButton();
  //
  final insertUpdate = InsertUpdate();

  double sliverappbarsize = 300;
  double finalPercent = 0;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animationController.forward();

    controllerParcelas = TextEditingController();
    controllerValor = TextEditingController();

    scrollController = ScrollController()
      ..addListener(() {
        double percent = (scrollController.offset) / (sliverappbarsize - 70);
        appstate.percent = percent;
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController.dispose();
    controllerParcelas.dispose();
    controllerValor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        floatingActionButton: floatButton.floatingActionButton(
            action: () {
              Navigator.pushNamed(context, '/insertPage');
            }, context: context),
        //
        body: SliverAppBarApp(
          expandedHeight: sliverappbarsize,
          percent: appstate.percent,
          scrollController: scrollController,
          context: context,
          appstate: appstate,
          title: widget.pageTitle,
        ),
      );
    });
  }
}
