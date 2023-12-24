import 'package:mobx/mobx.dart';
part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
