import 'dart:math';

import 'package:flutter/material.dart';

class Rules {
  double regraDeTres(entrada, saida, maxSize, valorBuscado) {
    double somatoria = entrada + saida;
    double y = (maxSize * valorBuscado) / somatoria;
    return y;
  }

  Color iconColors(currentBrightness, percent) {
    return currentBrightness == Brightness.dark
        ? Colors.white
        : percent > 0.5
            ? Colors.white
            : const Color(0xff325D55);
  }

  Color getRandomColor() {
    int randomNumber = Random().nextInt(2);
    return randomNumber == 0 ? Colors.red : Colors.green;
  }
}
