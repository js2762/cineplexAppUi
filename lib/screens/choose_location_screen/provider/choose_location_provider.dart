import 'package:flutter/cupertino.dart';

class ChooseLocationProvider with ChangeNotifier {
  final List<String> stateList = [
    'Vienna',
    'Lower austria',
    'Upper Austria',
    'Burgenland',
    'Styria',
    'Carinthia',
    'Salzburg',
    'Tyrol',
    'Vorarlberg',
  ];

  int selectedStateIndex = -1;

  void selectState(int index){
    selectedStateIndex = index;
    notifyListeners();
  }
}
