import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Rules {

  double regraDeTres(entrada, saida, maxSize, valorBuscado) {
    double somatoria = entrada + saida;
    double y = (maxSize * valorBuscado) / somatoria;
    return y;
  }

  Color iconColors(currentBrightness, percent, context) {
    return currentBrightness == Brightness.dark
        ? percent > 0.5
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primary
        : percent > 0.5
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.primary;
  }

  Color textColors(context) {

  Brightness currentBrightness = MediaQuery.of(context).platformBrightness;

    return currentBrightness == Brightness.light
        ? const Color(0xffFFFFFF)
        : const Color(0xff39ff14);
  }

  Color getRandomColor() {
    int randomNumber = Random().nextInt(2);
    return randomNumber == 0 ? Colors.red : Colors.green;
  }

  Future<Map> pickedDateRange(context) async {
    DateTimeRange? dateRange = await showDateRangePicker(
        context: context, firstDate: DateTime(200), lastDate: DateTime(2099));
    //
    if (dateRange == null) {
      return await defautDateRange();
    }
    //
    final originStartDate = dateRange.start.toString();
    DateTime startDate = DateTime.parse(originStartDate);
    //
    final originEndDate = dateRange.end.toString();
    DateTime endDate = DateTime.parse(originEndDate);
    endDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59, 999);
    //
    final String startformattedDate =
        "${DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(startDate)}Z";
    final String endformattedDate =
        "${DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").format(endDate)}Z";
    //
    return {
      'start': startformattedDate,
      'final': endformattedDate,
    };
  }

  Future<Map> defautDateRange() async {
    DateTime now = DateTime.now();
    return {
      'start': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime(now.year, now.month, 1)),
      'final': DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS")
          .format(DateTime(now.year, now.month + 1, 0)),
    };
  }
  
}
