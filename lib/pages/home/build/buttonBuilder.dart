// ignore_for_file: file_names
import 'package:financas/pages/home/rules/rules.dart';
import 'package:flutter/material.dart';

class ButtonBuilder {
  
  final rules = Rules();

  List<Map<String, dynamic>> iconsMap = [
    {'icon': const Icon(Icons.add), 'tootip': 'Inserir'},
    {'icon': const Icon(Icons.calendar_month), 'tootip': 'Selecionar datas'},
    {'icon': const Icon(Icons.settings), 'tootip': 'COnfigurações'},
    //
    {'icon': const Icon(Icons.people), 'tootip': 'Inserir'},
    {
      'icon': const Icon(Icons.brightness_1_outlined),
      'tootip': 'Selecionar datas'
    },
    {'icon': const Icon(Icons.format_align_center), 'tootip': 'COnfigurações'},
  ];

  List<Widget> buttons = [];
  buttonBuilder(BuildContext context) {
    for (var i = 0; i < iconsMap.length; i++) {
      buttons.add(Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {
            iconsMap[i]['action'];
          },
          icon: iconsMap[i]['icon'],
          tooltip: iconsMap[i]['tootip'],
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
              iconSize: const MaterialStatePropertyAll(30),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onBackground)),
        ),
      ));
    }
    return buttons;
  }
}
