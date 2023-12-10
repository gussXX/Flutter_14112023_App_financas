// ignore_for_file: non_constant_identifier_names
import 'package:financas/mobX/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppBody {
  SingleChildScrollView singleChildScrollView({required AppState app_state}) {
    return SingleChildScrollView(
        child: Center(
          child: Column(
              children: [
          Observer(
            builder: (_) {
              return Text('Valor = ${app_state.value}');
            },
          ),
               Container(
                height: 1400, 
                width: 20, 
                decoration: const BoxDecoration(
                  color: Colors.cyan
                  )
                )
              ],
            ),
        ));
  }
}
