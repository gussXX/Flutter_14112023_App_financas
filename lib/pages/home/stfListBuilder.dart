// ignore_for_file: file_names, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:financas/pages/home/rules/lists.dart';
import 'package:flutter/material.dart';

class ListFinalBuilder extends StatefulWidget {
  const ListFinalBuilder({super.key, required rules, required ListValues});

  @override
  State<ListFinalBuilder> createState() => _ListFinalBuilderState();
}

class _ListFinalBuilderState extends State<ListFinalBuilder> {

ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 27,
        controller: listScrollController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: listValues.listValues(
              context: context, 
              index: index,
              colorRandom: rules.getRandomColor(),
            ),
          );
        },
    );
  }
}