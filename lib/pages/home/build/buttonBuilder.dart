import 'package:flutter/material.dart';

class ButtonBuilder {
  List<Map> iconsMap = const [
    {'icon': Icon(Icons.add), 'tootip': 'Inserir'},
    {'icon': Icon(Icons.calendar_month), 'tootip': 'Selecionar datas'},
    {'icon': Icon(Icons.settings), 'tootip': 'COnfigurações'},
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
              iconColor: MaterialStateProperty.all(const Color(0xff325D55)),
              iconSize: const MaterialStatePropertyAll(40),
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
