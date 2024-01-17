// ignore_for_file: file_names, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarBuilder {
  Brightness? currentBrightness;
  BuildContext? context;
  AppState? appstate;
  double? randomValue;

  final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  SizedBox collapsedBar({
    required BuildContext context,
    required Rules rules,
    required AppState appstate,
  }) {
    return SizedBox(
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
                color: rules.iconColors(currentBrightness, appstate.percent))
          ],
        ),
      ),
    );
  }

  Row expandedBar({
    required BuildContext context,
    required Rules rules,
    required AppState appstate,
    required double randomValue
  }) {
    return Row(
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
