// ignore_for_file: unused_local_variable

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarBuilder extends StatefulWidget {
  final Brightness currentBrightness;
  final BuildContext context;
  final AppState appstate;
  final double randomValue;
  final Rules rules;

  final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  BarBuilder({
    super.key,
    required this.currentBrightness,
    required this.context,
    required this.appstate,
    required this.randomValue,
    required this.rules,
  });

  @override
  State<BarBuilder> createState() {
    return _BarBuilderState();
  }
}

class _BarBuilderState extends State<BarBuilder> {
  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = widget.currentBrightness;
    BuildContext context = widget.context;
    AppState appstate = widget.appstate;
    double randomValue = widget.randomValue;
    Rules rules = widget.rules;

    final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return appstate.percent > 0.5
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
                      color:
                          rules.iconColors(currentBrightness, appstate.percent))
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
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "${formatoMoeda.format(randomValue)}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
