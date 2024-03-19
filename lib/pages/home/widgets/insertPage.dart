// ignore_for_file: file_names, unnecessary_overrides, unused_local_variable
import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/rules/insertUpdate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:glass/glass.dart';
import 'package:intl/intl.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() {
    return _InsertPageState();
  }
}

class _InsertPageState extends State<InsertPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  //
  late TextEditingController controllerParcelas;
  late TextEditingController controllerValor;
  //
  final appstate = AppState();
  //
  final insertUpdate = InsertUpdate();

  Future<bool> buildRequest() async {
    if (appstate.fontMonth == '') {
      var monthName = DateFormat('MMMM', 'en')
          .format(DateTime(DateTime.now().year, DateTime.now().month));
      appstate.fontMonth = monthName;
    }
    Map request = {
      "user": "Teste",
      "id": "65f8fe787112651c87dca4b9",
      //
      "date": appstate.fontDateTime.toIso8601String(),
      "year": appstate.fontDateTime.year,
      "mounth": appstate.fontMonth,
      //
      "tipe": {
        "categories": appstate.dropdownButtonValue,
        "font": appstate.fontString
      },
      //
      "values": {
        "value": appstate.fontValue,
        "parc": {
          "isInstallments": appstate.fontParc <= 1 ? false : true,
          "quant": appstate.fontParc
        }
      }
    };
    final bool response = await insertUpdate.inserUpdate(filter: request);
    appstate.changestateResponseInsert(response);
    await Future.delayed(const Duration(seconds: 1));
    return response;
  }

  OverlayEntry? _overlayEntry;
  void _showLoadingOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Observer(builder: (_) {
          return Container(
            color: Colors.black.withOpacity(0.5),
            child: Stack(children: [
              Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.1))
                  .asGlass(
                blurX: 2,
                blurY: 2,
                frosted: false,
              ),
              Center(
                child: FutureBuilder(
                  future: buildRequest(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        if (appstate.stateResponseInsert == false) {
                          _hideLoadingOverlay();
                          return Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.error,
                                  color: Colors.red, size: 50),
                              Text(
                                'Deu Algo Errado!',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ));
                        }
                        _hideLoadingOverlay();
                        return Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.check_circle,
                                color: Colors.green, size: 50),
                            Text(
                              'Valores incluidos',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ));
                      default:
                        return Container();
                    }
                  },
                ),
              ),
            ]),
          );
        }),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideLoadingOverlay() async {
    await Future.delayed(const Duration(seconds: 1));
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    controllerParcelas = TextEditingController();
    controllerValor = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerParcelas.dispose();
    controllerValor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('Segunda Página')),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Observer(builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Entrada',
                                style: Theme.of(context).textTheme.titleMedium),
                            Radio(
                              value: 'entrada',
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              groupValue: appstate.fontString,
                              onChanged: (value) {
                                appstate.changeFontString(value);
                                appstate.requestFilter['tipe']['font'] = value;
                                print(appstate.requestFilter);
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              value: 'saida',
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              groupValue: appstate.fontString,
                              onChanged: (value) {
                                appstate.changeFontString(value);
                                appstate.requestFilter['tipe']['font'] = value;
                                print(appstate.requestFilter);
                              },
                            ),
                            Text('Saida',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 2,
                    ),
                  ),
                  Observer(builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0))),
                                elevation: const MaterialStatePropertyAll(0),
                                fixedSize: const MaterialStatePropertyAll(
                                    Size(128, 20)),
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.fromLTRB(20, 2, 20, 2)),
                                backgroundColor: appstate.selectButton
                                    ? MaterialStatePropertyAll(Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.5))
                                    : MaterialStatePropertyAll(Theme.of(context)
                                        .colorScheme
                                        .background
                                        .withOpacity(0.5))),
                            onPressed: appstate.selectButton
                                ? null
                                : () {
                                    print(DateTime.now());
                                    appstate.changeSelectButton();
                                    appstate.requestFilter['date'] =
                                        DateTime.now();
                                    appstate.requestFilter['year'] =
                                        DateTime.now().year;
                                    //
                                    var monthNumber = DateTime.now();
                                    var monthName = DateFormat('MMMM', 'en')
                                        .format(DateTime(DateTime.now().year,
                                            monthNumber.month));
                                    //
                                    appstate.requestFilter['mounth'] =
                                        monthName;
                                    print(appstate.requestFilter);
                                  },
                            child: Text('Hoje',
                                style:
                                    Theme.of(context).textTheme.titleMedium)),
                        Observer(builder: (_) {
                          return ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0))),
                                  elevation: const MaterialStatePropertyAll(0),
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(200, 20)),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.fromLTRB(20, 2, 20, 2)),
                                  backgroundColor: !appstate.selectButton
                                      ? MaterialStatePropertyAll(
                                          Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5))
                                      : MaterialStatePropertyAll(
                                          Theme.of(context)
                                              .colorScheme
                                              .background
                                              .withOpacity(0.5))),
                              onPressed: !appstate.selectButton
                                  ? null
                                  : () async {
                                      Future.delayed(
                                          const Duration(milliseconds: 500));
                                      var dateTime = await showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1999),
                                          lastDate: DateTime(2999));
                                      //
                                      if (dateTime != null) {
                                        appstate.fontDateTime = dateTime;
                                        //
                                        var monthNumber = dateTime;
                                        var monthName = DateFormat('MMMM', 'en')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                monthNumber.month));
                                        //
                                        appstate.fontDateTime = dateTime;
                                        appstate.fontMonth = monthName;
                                        //
                                        appstate.requestFilter['year'] =
                                            dateTime.year;
                                        appstate.requestFilter['mounth'] =
                                            monthName;
                                        appstate.requestFilter['date'] =
                                            dateTime;
                                        //
                                        print(appstate.requestFilter);
                                      } else {
                                        appstate.fontDateTime = DateTime.now();
                                        //
                                        var monthNumber = DateTime.now();
                                        var monthName = DateFormat('MMMM', 'en')
                                            .format(DateTime(
                                                DateTime.now().year,
                                                monthNumber.month));
                                        //
                                        appstate.fontDateTime = monthNumber;
                                        appstate.fontMonth = monthName;
                                        //
                                        appstate.requestFilter['year'] =
                                            monthNumber.year;
                                        appstate.requestFilter['mounth'] =
                                            monthName;
                                        appstate.requestFilter['date'] =
                                            monthNumber;
                                        //
                                        print(appstate.requestFilter);
                                      }
                                      appstate.changeSelectButton();
                                    },
                              child: Text(
                                'Data especifica',
                                style: Theme.of(context).textTheme.titleMedium,
                              ));
                        }),
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 128,
                        child: Observer(builder: (_) {
                          return DropdownButton(
                            elevation: 0,
                            alignment: AlignmentDirectional.center,
                            value: appstate.dropdownButtonValue,
                            onChanged: (String? value) {
                              if (value != null) {
                                appstate.changeDropdownButtonValue(value);
                              }
                            },
                            items: <String>[
                              'Outros',
                              'Conta',
                              'Salário',
                              'Diversão',
                              'Carro',
                              'Comida',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 50,
                        width: 128,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: controllerValor,
                          onSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                            if (value.isNotEmpty) {
                              String cleanedValue = value
                                  .replaceAll(' ', '')
                                  .replaceAll(',', '.');
                              appstate.fontValue =
                                  double.parse(cleanedValue) + 0.0;
                            }
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              String cleanedValue = value
                                  .replaceAll(' ', '')
                                  .replaceAll(',', '.');
                              appstate.fontValue =
                                  double.parse(cleanedValue) + 0.0;
                            }
                          },
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              contentPadding: const EdgeInsets.all(10.0),
                              labelText: 'Valor',
                              labelStyle: const TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text('Quantas Parcelas?',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      SizedBox(
                        height: 50,
                        width: 128,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: controllerParcelas,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              String cleanedValue = value
                                  .replaceAll(',', '')
                                  .replaceAll(' ', '')
                                  .replaceAll('.', '');
                              int cleanedValueInt = int.parse(cleanedValue);
                              appstate.fontParc = cleanedValueInt;
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                            if (value.isNotEmpty) {
                              String cleanedValue = value
                                  .replaceAll(',', '')
                                  .replaceAll(' ', '')
                                  .replaceAll('.', '');
                              int cleanedValueInt = int.parse(cleanedValue);
                              appstate.fontParc = cleanedValueInt;
                              print(cleanedValueInt);
                            }
                          },
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              contentPadding: const EdgeInsets.all(10.0),
                              labelText: 'parcelas',
                              labelStyle: const TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Divider(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 2,
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0))),
                          elevation: const MaterialStatePropertyAll(0),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(220, 30)),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(20, 2, 20, 2)),
                          backgroundColor: !appstate.selectButton
                              ? MaterialStatePropertyAll(Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5))
                              : MaterialStatePropertyAll(Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.5))),
                      onPressed: () async {
                        if (controllerValor.text.isEmpty == true ||
                            controllerParcelas.text.isEmpty == true) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Campos vazios'),
                                  content: const Text(
                                      'Você deixou campos importantes em branco.'),
                                  actions: [
                                    TextButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else {
                          _showLoadingOverlay(context);
                          //bool responde = await buildRequest();
                          //appstate.stateResponseInsert = responde;
                        }
                      },
                      child: Text(
                        'Enviar informações',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      )),
                ]),
          ),
        ));
  }
}
