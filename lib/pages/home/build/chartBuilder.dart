// ignore_for_file: file_names, must_be_immutable, unnecessary_string_interpolations, no_logic_in_create_state, avoid_print, sized_box_for_whitespace, unused_local_variable, unused_import
import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/rules/rules.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class ChartBuilder extends StatefulWidget {
  double maxSize;
  double entrada;
  double saida;
  bool building;
  AppState appstate;

  ChartBuilder({
    super.key,
    required this.maxSize,
    required this.entrada,
    required this.saida,
    required this.building,
    required this.appstate,
  });

  @override
  State<ChartBuilder> createState() {
    print('CHART CRIADO');
    return _ChartBuilderState();
  }
}

class _ChartBuilderState extends State<ChartBuilder> {
  //
  @override
  void initState() {
    print('CHART INICIADO');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final rules = Rules();
  final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    print('CHART CONSTRUIDO');
    double maxSize = widget.maxSize;
    double entrada = widget.entrada;
    double saida = widget.saida;
    AppState appState = widget.appstate;

    return BarChart(
      BarChartData(
        gridData: const FlGridData(
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxSize,
        minY: 0,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.black,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '',
                const TextStyle(color: Colors.grey, fontSize: 12),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  reservedSize: 40,
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return Text(
                          '${formatoMoeda.format(entrada)}',
                          style: const TextStyle(color: Colors.green),
                        );
                      case 1:
                        return Text(
                          '${formatoMoeda.format(saida)}',
                          style: const TextStyle(color: Colors.red),
                        );
                      default:
                        return Text(meta.toString());
                    }
                  },
                )),
            leftTitles: const AxisTitles(drawBelowEverything: false),
            bottomTitles: AxisTitles(
              drawBelowEverything: true,
              axisNameSize: 50,
              sideTitles: SideTitles(
                reservedSize: 40,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Padding(
                        padding:  EdgeInsets.only(top: 10),
                        child: Text(
                          'Entradas',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      );
                    case 1:
                      return const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          'Saídas',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      );
                    default:
                      return Text(meta.toString());
                  }
                },
              ),
            ),
            rightTitles: const AxisTitles(drawBelowEverything: false)),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                width: 70,
                borderRadius: BorderRadius.circular(8),
                toY: entrada != 0 ? rules.regraDeTres(entrada, saida,
                    maxSize, entrada) : 0,
                color: Colors.green,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                width: 70,
                borderRadius: BorderRadius.circular(8),
                toY: saida != 0 ? rules.regraDeTres(
                    entrada, saida, maxSize, saida) : 0,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
