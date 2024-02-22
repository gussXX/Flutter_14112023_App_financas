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

  @observable
  bool enableFilter = false;

  @observable
  double balance = 0;

  @observable
  String dropdownButtonValue = 'Outros';

  @observable
  bool selectButton = true;

  @observable
  DateTime fontDateTime = DateTime.now();
  @observable
  String fontString = 'entrada';
  @observable
  String fontMonth = '';
  @observable
  double fontValue = 0.0;
  @observable
  int fontParc = 0;

  @observable
  Map requestFilter = {
    "user": "Teste",
    "id": "64cfc4bcdd83f5737a40f71d",

    "date" : 0,
    "year": 0,
    "mounth": "",

    "tipe": {
      "categories": "none", 
      "font": "none"
      },
      
    "values": {
      "value": 5.99,
      "parc": {
        "isInstallments": false, 
        "quant": 1
        }
    }
  };
  @observable
  bool stateResponseInsert = true;

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

  @action
  bool changeStateFilter() {
    bool result = enableFilter = !enableFilter;
    return result;
  }

  @action
  void getBalance(double value) {
    balance = value;
  }

  @action
  void changeDropdownButtonValue(String value) {
    dropdownButtonValue = value;
  }

  @action
  void changeSelectButton() {
    selectButton = !selectButton;
  }

  @action
  void changeFontString(value){
    fontString = value;
  }

  @action
  void changestateResponseInsert(bool value){
    stateResponseInsert = value;
  }

}
