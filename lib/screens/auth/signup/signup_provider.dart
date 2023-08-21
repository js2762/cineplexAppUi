import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  bool policyButtonVal = false;
  bool termsButtonVal = false;
  bool bonusCardTermsVal = false;
  bool pushNotificationSwitchVal = false;
  bool switch2Val = false;
  bool actionSwitchVal = false;
  bool operaSwitchVal = false;
  bool usageDataVal = false;
  int selectedPage = 0;
  int selectedBottomSheetVal = -1;
  final List<String> bottomSheet = ['Male','Female'];
  String? genderVal;
  String? selectedDate;


  void selectDate(String dateValue){
    selectedDate = dateValue;
    notifyListeners();
  }

  void selectBottomSheetValue(int indexValue){
    selectedBottomSheetVal = indexValue;
    genderVal = bottomSheet[indexValue];
   // print(selectedBottomSheetVal);
    notifyListeners();
  }

  void policyButtonAction() {
    policyButtonVal = !policyButtonVal;
    notifyListeners();
  }

  void termsButtonAction() {
    termsButtonVal = !termsButtonVal;
    notifyListeners();
  }

  void bonusCardTermsAction() {
    bonusCardTermsVal = !bonusCardTermsVal;
    notifyListeners();
  }

  void pushNotificationAction(bool value) {
    pushNotificationSwitchVal = value;
    notifyListeners();
  }

  void switch2Action(bool value) {
    switch2Val = value;
    notifyListeners();
  }

  void switchAction(bool value) {
    actionSwitchVal = value;
    notifyListeners();
  }

  void operaSwitchAction(bool value) {
    operaSwitchVal = value;
    notifyListeners();
  }

  void usageDataAction(bool value) {
    usageDataVal = value;
    notifyListeners();
  }

  void navigateToNextPage() {
    selectedPage = selectedPage + 1;
    notifyListeners();
  }

  void navigateBackToPage(BuildContext context) {
    if (selectedPage > 0) {
      selectedPage = selectedPage - 1;
    } else if(selectedPage <= 0){
      Navigator.of(context).pop();
    }
    notifyListeners();
  }
}
