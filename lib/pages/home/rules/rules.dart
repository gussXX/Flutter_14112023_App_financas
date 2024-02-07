import 'dart:math';
import 'package:flutter/material.dart';

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
}
