// ignore_for_file: file_names, non_constant_identifier_names, avoid_types_as_parameter_names, no_logic_in_create_state
import 'package:flutter/material.dart';

class ListFinalBuilder extends StatefulWidget {
  const ListFinalBuilder({super.key});

  @override
  State<ListFinalBuilder> createState() {
    print('ESTADO CRIADO');
    return _ListFinalBuilderState();
  }
}

class _ListFinalBuilderState extends State<ListFinalBuilder> {
  @override
  void initState() {
    print('ESTADO INICIADO');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  ScrollController listScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
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
              child: Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.onBackground,
                child: const ListTile(
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
            ));
      },
    );
  }
}
