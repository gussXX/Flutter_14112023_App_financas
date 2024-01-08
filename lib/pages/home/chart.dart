// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_local_variable, unused_element, unnecessary_brace_in_string_interps

import 'package:financas/pages/home/rules/rules.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ChartHome {
  double? maxSize;
  double? entrada;
  double? saida;

  BarChart barchat(
      {required double maxSize,
      required double entrada,
      required double saida}) {

    final rules = Rules();
    final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    
    return BarChart(
      BarChartData(
        gridData: FlGridData(
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxSize,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                'Valor ${group.x}',
                const TextStyle(color: Colors.grey),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return Text(
                          '${formatoMoeda.format(entrada)}',
                          style: TextStyle(color: Colors.green),
                        );
                      case 1:
                        return Text(
                          '${formatoMoeda.format(saida)}',
                          style: TextStyle(color: Colors.red),
                        );
                      default:
                        return Text(meta.toString());
                    }
                  },
                )),
            leftTitles: AxisTitles(drawBelowEverything: false),
            bottomTitles: AxisTitles(
              drawBelowEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text(
                        'Entradas',
                        style: TextStyle(color: Colors.green),
                      );
                    case 1:
                      return Text(
                        'Saídas',
                        style: TextStyle(color: Colors.red),
                      );
                    default:
                      return Text(meta.toString());
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(drawBelowEverything: false)),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                width: 20,
                toY: rules.regraDeTres(entrada, saida, maxSize, entrada),
                color: Colors.green,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                width: 20,
                toY: rules.regraDeTres(entrada, saida, maxSize, saida),
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
