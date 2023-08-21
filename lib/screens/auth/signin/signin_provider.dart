import 'package:flutter/cupertino.dart';

class SignInProvider with ChangeNotifier {
  bool visibilityValue = true;

  void toggleVisibility() {
    visibilityValue = !visibilityValue;
    notifyListeners();
  }
}
