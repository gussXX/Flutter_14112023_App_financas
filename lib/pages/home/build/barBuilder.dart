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

  SizedBox collapsedBar(
      {required BuildContext context,
      required Rules rules,
      required AppState appstate,
      required double balance}) {
    return SizedBox(
      key: const ValueKey(1),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${formatoMoeda.format(balance)}",
              style: TextStyle(
                color: rules.textColors(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row expandedBar(
      {required BuildContext context,
      required Rules rules,
      required AppState appstate,
      required double balance}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          key: const ValueKey(2),
          width: MediaQuery.of(context).size.width - 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: Theme.of(context).colorScheme.onBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo de',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "${formatoMoeda.format(balance)}",
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                Container(
                    height: 120,
                    width: 1,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Saúde financeira:',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Estável.',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
