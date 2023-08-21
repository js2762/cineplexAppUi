import 'package:flutter/cupertino.dart';

class ChooseDateProvider with ChangeNotifier {
  List<DateTime> datesToShow = [];
  bool showNext14Days = false;
  int selectedDayIndex = -1;

  void updateDates() {
    final currentDate = DateTime.now();
    final numberOfDays = showNext14Days ? 14 : 7;
    datesToShow = List.generate(
        numberOfDays, (index) => currentDate.add(Duration(days: index)));
    notifyListeners();
  }

  void toggleViewDays(){
    showNext14Days = !showNext14Days;
    updateDates();
  }

  void selectDay(int index){
    selectedDayIndex = index;
    notifyListeners();
  }
}
