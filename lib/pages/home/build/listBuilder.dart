// ignore_for_file: file_names, non_constant_identifier_names, avoid_types_as_parameter_names, no_logic_in_create_state, unnecessary_brace_in_string_interps, avoid_print
import 'package:flutter/material.dart';

class ListFinalBuilder extends StatefulWidget {
  const ListFinalBuilder({super.key});

  @override
  State<ListFinalBuilder> createState() {
    print('LIST BUILDER CRIADO');
    return _ListFinalBuilderState();
  }
}

class _ListFinalBuilderState extends State<ListFinalBuilder> {
  @override
  void initState() {
    print('LIST BUILDER INICIADO');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScrollController listScrollController = ScrollController();
  bool controlleDismiss = false;

  @override
  Widget build(BuildContext context) {
    print('LIST BUILDER CONSTRUIDO');

    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      controller: listScrollController,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Dismissible(
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
                return controlleDismiss;
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
                child: ListTile(
                  leading: const Icon(Icons.arrow_upward_sharp,
                      color: Colors.red, size: 30),
                  title: Text('Titulo ${index}',
                      style: const TextStyle(fontSize: 20)),
                  subtitle: Text(
                    '${index}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
