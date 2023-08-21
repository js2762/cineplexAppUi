import 'package:flutter/cupertino.dart';

class MainScreenProvider with ChangeNotifier {
  int bottomNavigationBarIndex = 0;

  void bottomNavigationBarOnTap(int indexValue){
    bottomNavigationBarIndex = indexValue;
    notifyListeners();
  }
}