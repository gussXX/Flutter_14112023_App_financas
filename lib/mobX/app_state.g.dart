// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on AppStateBase, Store {
  late final _$valueAtom = Atom(name: 'AppStateBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$percentAtom =
      Atom(name: 'AppStateBase.percent', context: context);

  @override
  double get percent {
    _$percentAtom.reportRead();
    return super.percent;
  }

  @override
  set percent(double value) {
    _$percentAtom.reportWrite(value, super.percent, () {
      super.percent = value;
    });
  }

  late final _$chartLoadingStateAtom =
      Atom(name: 'AppStateBase.chartLoadingState', context: context);

  @override
  bool get chartLoadingState {
    _$chartLoadingStateAtom.reportRead();
    return super.chartLoadingState;
  }

  @override
  set chartLoadingState(bool value) {
    _$chartLoadingStateAtom.reportWrite(value, super.chartLoadingState, () {
      super.chartLoadingState = value;
    });
  }

  late final _$listLoadingStateAtom =
      Atom(name: 'AppStateBase.listLoadingState', context: context);

  @override
  bool get listLoadingState {
    _$listLoadingStateAtom.reportRead();
    return super.listLoadingState;
  }

  @override
  set listLoadingState(bool value) {
    _$listLoadingStateAtom.reportWrite(value, super.listLoadingState, () {
      super.listLoadingState = value;
    });
  }

  late final _$enableFilterAtom =
      Atom(name: 'AppStateBase.enableFilter', context: context);

  @override
  bool get enableFilter {
    _$enableFilterAtom.reportRead();
    return super.enableFilter;
  }

  @override
  set enableFilter(bool value) {
    _$enableFilterAtom.reportWrite(value, super.enableFilter, () {
      super.enableFilter = value;
    });
  }

  late final _$balanceAtom =
      Atom(name: 'AppStateBase.balance', context: context);

  @override
  double get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(double value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  late final _$dropdownButtonValueAtom =
      Atom(name: 'AppStateBase.dropdownButtonValue', context: context);

  @override
  String get dropdownButtonValue {
    _$dropdownButtonValueAtom.reportRead();
    return super.dropdownButtonValue;
  }

  @override
  set dropdownButtonValue(String value) {
    _$dropdownButtonValueAtom.reportWrite(value, super.dropdownButtonValue, () {
      super.dropdownButtonValue = value;
    });
  }

  late final _$selectButtonAtom =
      Atom(name: 'AppStateBase.selectButton', context: context);

  @override
  bool get selectButton {
    _$selectButtonAtom.reportRead();
    return super.selectButton;
  }

  @override
  set selectButton(bool value) {
    _$selectButtonAtom.reportWrite(value, super.selectButton, () {
      super.selectButton = value;
    });
  }

  late final _$fontDateTimeAtom =
      Atom(name: 'AppStateBase.fontDateTime', context: context);

  @override
  DateTime get fontDateTime {
    _$fontDateTimeAtom.reportRead();
    return super.fontDateTime;
  }

  @override
  set fontDateTime(DateTime value) {
    _$fontDateTimeAtom.reportWrite(value, super.fontDateTime, () {
      super.fontDateTime = value;
    });
  }

  late final _$fontStringAtom =
      Atom(name: 'AppStateBase.fontString', context: context);

  @override
  String get fontString {
    _$fontStringAtom.reportRead();
    return super.fontString;
  }

  @override
  set fontString(String value) {
    _$fontStringAtom.reportWrite(value, super.fontString, () {
      super.fontString = value;
    });
  }

  late final _$fontMonthAtom =
      Atom(name: 'AppStateBase.fontMonth', context: context);

  @override
  String get fontMonth {
    _$fontMonthAtom.reportRead();
    return super.fontMonth;
  }

  @override
  set fontMonth(String value) {
    _$fontMonthAtom.reportWrite(value, super.fontMonth, () {
      super.fontMonth = value;
    });
  }

  late final _$fontValueAtom =
      Atom(name: 'AppStateBase.fontValue', context: context);

  @override
  double get fontValue {
    _$fontValueAtom.reportRead();
    return super.fontValue;
  }

  @override
  set fontValue(double value) {
    _$fontValueAtom.reportWrite(value, super.fontValue, () {
      super.fontValue = value;
    });
  }

  late final _$fontParcAtom =
      Atom(name: 'AppStateBase.fontParc', context: context);

  @override
  int get fontParc {
    _$fontParcAtom.reportRead();
    return super.fontParc;
  }

  @override
  set fontParc(int value) {
    _$fontParcAtom.reportWrite(value, super.fontParc, () {
      super.fontParc = value;
    });
  }

  late final _$requestFilterAtom =
      Atom(name: 'AppStateBase.requestFilter', context: context);

  @override
  Map<dynamic, dynamic> get requestFilter {
    _$requestFilterAtom.reportRead();
    return super.requestFilter;
  }

  @override
  set requestFilter(Map<dynamic, dynamic> value) {
    _$requestFilterAtom.reportWrite(value, super.requestFilter, () {
      super.requestFilter = value;
    });
  }

  late final _$AppStateBaseActionController =
      ActionController(name: 'AppStateBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.increment');
    try {
      return super.increment();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeChartLoadingState() {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.changeChartLoadingState');
    try {
      return super.changeChartLoadingState();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetChartLoadingState(dynamic value) {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.resetChartLoadingState');
    try {
      return super.resetChartLoadingState(value);
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeListLoadingState() {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.changeListLoadingState');
    try {
      return super.changeListLoadingState();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetListLoadingState(dynamic value) {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.resetListLoadingState');
    try {
      return super.resetListLoadingState(value);
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool changeStateFilter() {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.changeStateFilter');
    try {
      return super.changeStateFilter();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getBalance(double value) {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.getBalance');
    try {
      return super.getBalance(value);
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDropdownButtonValue(String value) {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.changeDropdownButtonValue');
    try {
      return super.changeDropdownButtonValue(value);
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectButton() {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.changeSelectButton');
    try {
      return super.changeSelectButton();
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFontString(dynamic value) {
    final _$actionInfo = _$AppStateBaseActionController.startAction(
        name: 'AppStateBase.changeFontString');
    try {
      return super.changeFontString(value);
    } finally {
      _$AppStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
percent: ${percent},
chartLoadingState: ${chartLoadingState},
listLoadingState: ${listLoadingState},
enableFilter: ${enableFilter},
balance: ${balance},
dropdownButtonValue: ${dropdownButtonValue},
selectButton: ${selectButton},
fontDateTime: ${fontDateTime},
fontString: ${fontString},
fontMonth: ${fontMonth},
fontValue: ${fontValue},
fontParc: ${fontParc},
requestFilter: ${requestFilter}
    ''';
  }
}
