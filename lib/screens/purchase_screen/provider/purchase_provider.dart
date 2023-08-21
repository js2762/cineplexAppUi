import 'package:cineplex/models/cold_drink.dart';
import 'package:cineplex/models/snacks.dart';
import 'package:cineplex/resources/app_images.dart';
import 'package:flutter/cupertino.dart';

class PurchaseProvider with ChangeNotifier {
  int selectedPage = 0;
  int adultCountValue = 0;
  int childrenCountValue = 0;
  double containerHeight = 50.0;
  int finalAmount = 0;
  bool isExpanded = false;
  bool isZoom = false;
  bool giftCardValue = false;
  bool privacyPolicyValue = false;
  bool termsOfUseValue = false;
  int totalTicketAmount = 0;
  List<String> selectedSeatList = [];
  List<Snacks> orderedSnackList = [];
  List<ColdDrink> orderedColdDrinkList = [];

  List<Snacks> snackList = [
    Snacks(name: 'burger', price: 60, imagePath: AppImages.burgerImage),
    Snacks(name: 'pop-corn', price: 35, imagePath: AppImages.popcornImage),
    Snacks(name: 'samosa', price: 40, imagePath: AppImages.samosaImage),
  ];
  List<ColdDrink> drinkList = [
    ColdDrink(
        name: 'coca-cola',
        price: 40,
        quantity: '750ml',
        imagePath: AppImages.cocaColaImage),
    ColdDrink(
        name: 'orange-juice',
        price: 80,
        quantity: '450ml',
        imagePath: AppImages.orangeJuiceImage),
    ColdDrink(
        name: 'red-bull',
        price: 110,
        quantity: '100ml',
        imagePath: AppImages.redBullImage),
  ];

  String appBarText() {
    if (selectedPage == 0) {
      return 'Purchase of tickets';
    } else if (selectedPage == 1) {
      return 'Seats';
    } else if (selectedPage == 2) {
      return 'Select your Snacks';
    } else if (selectedPage == 3) {
      return 'Check Out';
    } else {
      return 'something went wrong!';
    }
  }

  void togglePrivacyPolicyValue() {
    privacyPolicyValue = !privacyPolicyValue;
    notifyListeners();
  }

  void toggleTermsOfUseValue() {
    termsOfUseValue = !termsOfUseValue;
    notifyListeners();
  }

  void toggleGiftCardValue(bool value) {
    giftCardValue = !giftCardValue;
    notifyListeners();
  }

  void orderedSnackDrink() {
    finalAmount = 0;
    int snackAmount = 0;
    int drinkAmount = 0;

    /// calculating amount for snacks
    var tempDataList = [...snackList.where((element) => element.count > 0 ).toList()];
    orderedSnackList = [...tempDataList];
    for(int i=0 ; i < orderedSnackList.length ; i++){
      snackAmount += (orderedSnackList[i].count * orderedSnackList[i].price);
    }

    /// calculating amount for drinks
    var tempDataList2 = [...drinkList.where((element) => element.count > 0 ).toList()];
    orderedColdDrinkList = [...tempDataList2];
    for(int i=0 ; i < orderedColdDrinkList.length ; i++){
      drinkAmount += (orderedColdDrinkList[i].count * orderedColdDrinkList[i].price);
    }

    /// sum of snack and cold-Drink amount
    finalAmount = snackAmount + drinkAmount;

    /// this notify is working even if it is comment because this method call along with countSnacksIncrement and inside notifylisteners is used that's why we have countered this behaviour.
   // notifyListeners();
  }

  void countSnacksIncrement(String name) {
    for (var element in snackList) {
      if (element.name == name) {
        element.count = element.count + 1;
      }
    }
    orderedSnackDrink();
    notifyListeners();
  }

  void countSnacksDecrement(String name) {
    for (var element in snackList) {
      if (element.name == name) {
        element.count = element.count - 1;
        if (element.count < 0) {
          element.count = 0;
        }
      }
    }
    orderedSnackDrink();
    notifyListeners();
  }

  void countDrinkIncrement(String name) {
    for (var element in drinkList) {
      if (element.name == name) {
        element.count = element.count + 1;
      }
    }
    orderedSnackDrink();
    notifyListeners();
  }

  void countDrinkDecrement(String name) {
    for (var element in drinkList) {
      if (element.name == name) {
        element.count = element.count - 1;
        if (element.count < 0) {
          element.count = 0;
        }
      }
    }
    orderedSnackDrink();
    notifyListeners();
  }

  void toggleContainer() {
    isExpanded = !isExpanded;
    containerHeight = isExpanded ? 250.0 : 50.0;
    notifyListeners();
  }

  void toggleZoom() {
    isZoom = !isZoom;
    notifyListeners();
  }

  void selectSeat(String seatName, String seatRow) {
    String selectedSeat = seatName + seatRow;
    if (selectedSeatList.contains(selectedSeat)) {
      selectedSeatList.remove(selectedSeat);
    } else {
      selectedSeatList.add(selectedSeat);
    }
    totalTicketAmount = selectedSeatList.length * 200;
    notifyListeners();
  }

  void navigateToNextPage() {
    selectedPage = selectedPage + 1;
    notifyListeners();
  }

  void navigateBackToPage(BuildContext context) {
    if (selectedPage > 0) {
      selectedPage = selectedPage - 1;
    } else if (selectedPage <= 0) {
      Navigator.of(context).pop();
    }
    notifyListeners();
  }

  void adultCountIncrement() {
    adultCountValue = adultCountValue + 1;
    notifyListeners();
  }

  void adultCountDecrement() {
    adultCountValue = adultCountValue - 1;
    if (adultCountValue < 0) {
      adultCountValue = 0;
    }
    notifyListeners();
  }

  void childrenCountIncrement() {
    childrenCountValue = childrenCountValue + 1;
    notifyListeners();
  }

  void childrenCountDecrement() {
    childrenCountValue = childrenCountValue - 1;
    if (childrenCountValue < 0) {
      childrenCountValue = 0;
    }
    notifyListeners();
  }
}
