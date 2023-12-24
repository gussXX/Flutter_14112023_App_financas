// ignore_for_file: avoid_print

import 'package:financas/mobX/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThisSliverAppbar {
  Function? context;
  AppState? appstate;
  String? title;
  ScrollController? scrollController;

  Color? color;

  CustomScrollView custonScrollView({
    required BuildContext context,
    required AppState appstate,
    required String title,
    required ScrollController scrollController,
    required Color color
    
  }) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(

          expandedHeight: 120,
          elevation: 0,

          pinned: true,
          floating: true,
          snap: true,

          shadowColor: Colors.transparent,
          backgroundColor: color,

          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              title, 
              style: Theme.of(context).textTheme.titleLarge), 
              centerTitle: false,
              collapseMode: CollapseMode.none,
              ),
          actions: [
            IconButton(onPressed: () {print(scrollController.position);}, 
            icon: const Icon(Icons.remove_red_eye_outlined), 
            color: Theme.of(context).colorScheme.secondary),
            IconButton(onPressed: () {}, icon: const Icon(Icons.flag_outlined), color: Theme.of(context).colorScheme.secondary),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person), color: Theme.of(context).colorScheme.secondary)
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate.fixed([
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 0, 0)),
                  ),
                  Observer(
                    builder: (_) {
                      return Text('Valor = ${appstate.value}');
                    },
                  ),
                  Container(
                    height: 1900,
                    width: 200,
                    decoration: const BoxDecoration(color: Colors.black),
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
