// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, unused_element
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListValues {
  Function? context;

  dynamic listValues({
    required BuildContext context,
  }) {
    final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(Icons.delete),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Icon(Icons.archive),
        ),
      ),
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.onBackground,
        child: ListTile(
          leading: Icon(Icons.arrow_upward_sharp,
              color: Colors.red, size: 30),
          title: Text('Titulo ${0}', style: TextStyle(fontSize: 20)),
          subtitle: Text(
            '123',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      onDismissed: (direction) {
        print('object');
      },
    );
  }
}
