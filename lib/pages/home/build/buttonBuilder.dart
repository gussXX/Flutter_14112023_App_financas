// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonBuilder {
  List<Map> iconsMap = const [
    {'icon': Icon(Icons.add), 'tootip': 'Inserir'},
    {'icon': Icon(Icons.calendar_month), 'tootip': 'Selecionar datas'},
    {'icon': Icon(Icons.settings), 'tootip': 'COnfigurações'},
    //
    {'icon': Icon(Icons.people), 'tootip': 'Inserir'},
    {'icon': Icon(Icons.brightness_1_outlined), 'tootip': 'Selecionar datas'},
    {'icon': Icon(Icons.format_align_center), 'tootip': 'COnfigurações'},
  ];

  List<Widget> buttons = [];
  buttonBuilder(BuildContext context) {
    for (var i = 0; i < iconsMap.length; i++) {
      buttons.add(Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {},
          icon: iconsMap[i]['icon'],
          tooltip: iconsMap[i]['tootip'],
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
              iconSize: const MaterialStatePropertyAll(30),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onBackground)),
        ),
      ));
    }
    return buttons;
  }
}
