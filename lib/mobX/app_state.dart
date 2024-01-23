import 'package:mobx/mobx.dart';
part 'app_state.g.dart';

class AppState = AppStateBase with _$AppState;

abstract class AppStateBase with Store {
  @observable
  int value = 0;

  @observable
  double percent = 0;

  @observable
  bool chartLoadingState = true;

  @observable
  bool listLoadingState = true;

  @action
  void increment() {
    value++;
  }

  @action
  void changeChartLoadingState() {
    chartLoadingState = !chartLoadingState;
  }

  @action
  void resetChartLoadingState(value) {
    !value;
  }

  @action
  void changeListLoadingState() {
    listLoadingState = !listLoadingState;
  }

  @action
  void resetListLoadingState(value) {
    !value;
  }
}
