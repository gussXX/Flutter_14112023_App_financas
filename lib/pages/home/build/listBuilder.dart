// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListBuilder extends StatefulWidget {
  final int listSize;
  final List listValues;

  const ListBuilder({
    super.key,
    required this.listSize,
    required this.listValues,
  });

  @override
  State<ListBuilder> createState() {
    return _ListBuilderState();
  }
}

ScrollController listScrollController = ScrollController();
bool controllerDismiss = false;

class _ListBuilderState extends State<ListBuilder> {
  //
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final formatoMoeda = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    //
    int listSize = widget.listSize;
    List listValues = widget.listValues;

    if (listValues.isEmpty) {
      return Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.onBackground,
              child: const Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                child: ListTile(
                  leading: Icon(Icons.check_circle_sharp,
                          color: Colors.green, size: 30),
                  title: Text('Sem valores para o periodo selecionado.',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),

                  contentPadding: EdgeInsets.all(4),
                ),
              ),
            );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: listSize,
        controller: listScrollController,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.delete),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.archive),
              ),
            ),
            confirmDismiss: (direction) async {
              return controllerDismiss;
            },
            resizeDuration: const Duration(seconds: 1),
            onDismissed: (direction) {
              if (direction.name == 'startToEnd') {
                final snackBar = SnackBar(
                  content: const Text('Deseja realmente remover?'),
                  action: SnackBarAction(
                    label: 'Confirmar',
                    onPressed: () {
                      print('O valor ${index} foi excluido!');
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {}
            },
            child: Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.onBackground,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: ListTile(
                  leading: listValues[index]['tipe'] == "entrada"
                      ? const Icon(Icons.arrow_downward_sharp,
                          color: Colors.green, size: 30)
                      : const Icon(Icons.arrow_upward_sharp,
                          color: Colors.red, size: 30),
                  title: Text('${listValues[index]['categories']}',
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${formatoMoeda.format(listValues[index]['value'])}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${formatoMoeda.format(listValues[index]['value'])}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.all(4),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
