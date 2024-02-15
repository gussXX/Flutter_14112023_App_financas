// ignore_for_file: non_constant_identifier_names, unused_import, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable, prefer_typing_uninitialized_variables, prefer_const_constructors, must_be_immutable, file_names, unused_element

import 'package:financas/mobX/app_state.dart';
import 'package:financas/pages/home/rules/insertUpdate.dart';
import 'package:financas/pages/home/widgets/floatButton.dart';
import 'package:financas/pages/home/widgets/sliverAppBar.dart';
import 'package:flutter/material.dart';
import 'package:financas/pages/login/appbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:masked_text_field/masked_text_field.dart';

class HomeApp extends StatefulWidget {
  HomeApp({super.key, required this.pageTitle});

  String pageTitle;
  @override
  State<HomeApp> createState() {
    return _HomeAppState();
  }
}

class _HomeAppState extends State<HomeApp>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  //
  late ScrollController scrollController;
  late AnimationController animationController;
  //
  late TextEditingController controllerParcelas;
  late TextEditingController controllerValor;
  //
  final appstate = AppState();
  final floatButton = FloatButton();
  final appbar = ThisppBar();
  //
  final insertUpdate = InsertUpdate();

  double sliver_appbar_size = 300;
  double finalPercent = 0;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationController.forward();

    controllerParcelas = TextEditingController();
    controllerValor = TextEditingController();

    scrollController = ScrollController()
      ..addListener(() {
        var initial = 0;
        var end = 62;
        double percent = (scrollController.offset) / (sliver_appbar_size - 70);
        appstate.percent = percent;
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController.dispose();
    super.dispose();
  }

  void exibirbottom() {
    showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        elevation: 0,
        context: context,
        builder: (BuildContext builderContext) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 60),
                child: Container(
                  width: 32,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.primary),
                ),
              )),
              // SizedBox(
              //   height: 50,
              //   child: TextField(
              //     style: TextStyle(
              //         fontSize: 20,
              //         color: Theme.of(context).colorScheme.primary),
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(4)),
              //         contentPadding: EdgeInsets.all(10.0),
              //         labelText: 'Digite aqui',
              //         labelStyle: TextStyle(fontSize: 16)),
              //   ),
              // ),
              Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Entrada',
                            style: Theme.of(context).textTheme.titleMedium),
                        Radio(
                          value: 'entrada',
                          activeColor: Theme.of(context).colorScheme.primary,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                          value: 'saida',
                          activeColor: Theme.of(context).colorScheme.primary,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(128, 20)),
                            padding: MaterialStatePropertyAll(
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
                                appstate.requestFilter['date'] = DateTime.now();
                                appstate.requestFilter['year'] =
                                    DateTime.now().year;
                                //
                                var monthNumber = DateTime.now();
                                var monthName = DateFormat('MMMM', 'en').format(
                                    DateTime(DateTime.now().year,
                                        monthNumber.month));
                                //
                                appstate.requestFilter['mounth'] = monthName;
                                print(appstate.requestFilter);
                              },
                        child: Text('Hoje',
                            style: Theme.of(context).textTheme.titleMedium)),
                    Observer(builder: (_) {
                      return ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(200, 20)),
                              padding: MaterialStatePropertyAll(
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
                                        .format(DateTime(DateTime.now().year,
                                            monthNumber.month));
                                    //
                                    appstate.fontDateTime = dateTime;
                                    appstate.fontMonth = monthName;
                                    //
                                    appstate.requestFilter['year'] =
                                        dateTime.year;
                                    appstate.requestFilter['mounth'] =
                                        monthName;
                                    appstate.requestFilter['date'] = dateTime;
                                    //
                                    print(appstate.requestFilter);
                                  } else {
                                    appstate.fontDateTime = DateTime.now();
                                    //
                                    var monthNumber = DateTime.now();
                                    var monthName = DateFormat('MMMM', 'en')
                                        .format(DateTime(DateTime.now().year,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
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
                          'Salario',
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
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllerValor,
                      focusNode: FocusNode(),
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                        String cleanedValue =
                            value.replaceAll(' ', '').replaceAll(',', '.');
                        appstate.fontValue = double.parse(value) + 0.0;
                        print(cleanedValue);
                      },
                      onChanged: (value) {
                        String cleanedValue =
                            value.replaceAll(' ', '').replaceAll(',', '.');
                        appstate.fontValue = double.parse(value) + 0.0;
                      },
                      // onEditingComplete: () {print(textEditingController.text);},
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          contentPadding: EdgeInsets.all(10.0),
                          labelText: 'Valor',
                          labelStyle: TextStyle(fontSize: 16)),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text('Quantas Parcelas?',
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllerParcelas,
                      onChanged: (value) {
                        String cleanedValue = value
                            .replaceAll(',', '')
                            .replaceAll(' ', '')
                            .replaceAll('.', '');
                        int cleanedValueInt = int.parse(cleanedValue);
                        appstate.fontParc = cleanedValueInt;
                      },
                      onSubmitted: (value) {
                        FocusScope.of(context).unfocus();
                        String cleanedValue = value
                            .replaceAll(',', '')
                            .replaceAll(' ', '')
                            .replaceAll('.', '');
                        int cleanedValueInt = int.parse(cleanedValue);
                        appstate.fontParc = cleanedValueInt;
                        print(cleanedValueInt);
                      },
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.primary),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          contentPadding: EdgeInsets.all(10.0),
                          labelText: 'parcelas',
                          labelStyle: TextStyle(fontSize: 16)),
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
              SizedBox(
                height: 90,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(220, 30)),
                      padding: MaterialStatePropertyAll(
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
                  onPressed: () {
                    void buildRequest() async {
                      if (appstate.fontMonth == '') {
                        var monthName = DateFormat('MMMM', 'en').format(
                            DateTime(DateTime.now().year, DateTime.now().month));
                            appstate.fontMonth = monthName;
                      }
                      Map request = {
                        "user": "Teste",
                        "id": "64cfc4bcdd83f5737a40f71d",
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
                            "isInstallments":
                                appstate.fontParc <= 1 ? false : true,
                            "quant": appstate.fontParc
                          }
                        }
                      };
                      print(request);
                      bool response = await insertUpdate.inserUpdate(filter: request);
                      print(response);
                    }

                    buildRequest();
                  },
                  child: Text(
                    'Enviar informações',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  )),
            ]),
          );
        }).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        floatingActionButton: floatButton.floatingActionButton(
            action: exibirbottom, context: context),
        //
        body: SliverAppBarApp(
          expandedHeight: sliver_appbar_size,
          percent: appstate.percent,
          scrollController: scrollController,
          context: context,
          appstate: appstate,
          title: widget.pageTitle,
        ),
      );
    });
  }
}
