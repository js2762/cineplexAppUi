import 'package:flutter/cupertino.dart';

class ChooseMonthProvider with ChangeNotifier {
  bool allMonthsValue = false;
  final List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  int selectedIndex = 0;

  List<String> remainingMonths = [];

  ChooseMonthProvider(){
    remainingMonths = monthNames.sublist(DateTime.now().month - 1);
    notifyListeners();
  }

  void toggleAllMonthsValue(){
    allMonthsValue = !allMonthsValue;
    notifyListeners();
  }

  void selectIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

}
