// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, file_names, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings

import 'package:financas/pages/home/rules/deleteUpdate.dart';
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
  final deleteUpdate = DeleteUpdate();
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
    print('LIST CONSTRUIDO');
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
            leading:
                Icon(Icons.check_circle_sharp, color: Colors.green, size: 30),
            title: Text('Sem valores para o periodo selecionado.',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            contentPadding: EdgeInsets.all(4),
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: listSize,
          controller: listScrollController,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              color: Theme.of(context).colorScheme.onBackground,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      elevation: 0,
                      useSafeArea: false,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
                            child: Column(
                              children: [
                                Text(
                                    '${listValues[index]['items']['_id'].toString()}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                const SizedBox(
                                  height: 60,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                          '${listValues[index]['items']['tipe']['categories']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                        '${formatoMoeda.format(listValues[index]['items']['values']['value'])}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium),
                                    listValues[index]['items']['tipe']
                                                ['font'] ==
                                            "entrada"
                                        ? const Icon(Icons.arrow_downward_sharp,
                                            color: Colors.green, size: 30)
                                        : const Icon(Icons.arrow_upward_sharp,
                                            color: Colors.red, size: 30),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20, top: 10),
                                  child: Divider(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    height: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20, bottom: 20),
                                  child: Divider(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.green),
                                              fixedSize:
                                                  MaterialStatePropertyAll(
                                                      Size(125, 25))),
                                          onPressed: (){},
                                          child: const Text(
                                            'Editar',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.red),
                                              fixedSize:
                                                  MaterialStatePropertyAll(
                                                      Size(125, 25))),
                                          onPressed: () async {
                                            final String id = listValues[index]['items']['_id'].toString();
                                            final int year = DateTime.parse(listValues[index]['items']['date']).year;
                                            final String monthName = DateFormat('MMMM').format(DateTime.parse(listValues[index]['items']['date']));

                                            print([id, year, monthName]);

                                           final result = await deleteUpdate.deleteUpdate(deleteQuery: {
                                              "user": "Teste",
                                              "id": "65f8fe787112651c87dca4b9",

                                              'filter': id,
                                              "years": year,
                                              "mounth": monthName
                                            });

                                            if (result) {
                                              
                                            } else {
                                              
                                            }
                                          },
                                          child: const Text(
                                            'Excluir',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  leading:
                      listValues[index]['items']['tipe']['font'] == "entrada"
                          ? const Icon(Icons.arrow_downward_sharp,
                              color: Colors.green, size: 30)
                          : const Icon(Icons.arrow_upward_sharp,
                              color: Colors.red, size: 30),
                  title: Text(
                      '${listValues[index]['items']['tipe']['categories']}',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${formatoMoeda.format(listValues[index]['items']['values']['value'])}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        '${DateTime.parse(listValues[index]['items']['date']).day}'
                        '/'
                        '${DateTime.parse(listValues[index]['items']['date']).month}'
                        '/'
                        '${DateTime.parse(listValues[index]['items']['date']).year}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.all(4),
                ),
              ),
            );
          },
        ),
      );
    }
  }
}


// Dismissible(
//             key: UniqueKey(),
//             direction: DismissDirection.horizontal,
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerLeft,
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.delete),
//               ),
//             ),
//             secondaryBackground: Container(
//               color: Colors.green,
//               alignment: Alignment.centerRight,
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(Icons.archive),
//               ),
//             ),
//             confirmDismiss: (direction) async {
//               return controllerDismiss;
//             },
//             resizeDuration: const Duration(seconds: 1),
//             onDismissed: (direction) {
//               if (direction.name == 'startToEnd') {
//                 final snackBar = SnackBar(
//                   content: const Text('Deseja realmente remover?'),
//                   action: SnackBarAction(
//                     label: 'Confirmar',
//                     onPressed: () {
//                       print('O valor ${index} foi excluido!');
//                     },
//                   ),
//                 );
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//               } else {}
//             },
//             child: Card(
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4)),
//               color: Theme.of(context).colorScheme.onBackground,
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 20, left: 20),
//                 child: ListTile(
//                   leading:
//                       listValues[index]['items']['tipe']['font'] == "entrada"
//                           ? const Icon(Icons.arrow_downward_sharp,
//                               color: Colors.green, size: 30)
//                           : const Icon(Icons.arrow_upward_sharp,
//                               color: Colors.red, size: 30),
//                   title: Text(
//                       '${listValues[index]['items']['tipe']['categories']}',
//                       style: const TextStyle(
//                           fontSize: 17, fontWeight: FontWeight.bold)),
//                   subtitle: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         '${formatoMoeda.format(listValues[index]['items']['values']['value'])}',
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                       Text(
//                         '${DateTime.parse(listValues[index]['items']['date']).day}'
//                         '/'
//                         '${DateTime.parse(listValues[index]['items']['date']).month}'
//                         '/'
//                         '${DateTime.parse(listValues[index]['items']['date']).year}',
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                   contentPadding: const EdgeInsets.all(4),
//                 ),
//               ),
//             ),
//           );
        