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
  String toString() {
    return '''
value: ${value},
percent: ${percent},
chartLoadingState: ${chartLoadingState},
listLoadingState: ${listLoadingState}
    ''';
  }
}
