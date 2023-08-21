import 'package:cineplex/models/movie_data.dart';
import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/main_screen/views/main_screen_view.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:cineplex/screens/purchase_screen/views/purchase5_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Purchase4View extends StatelessWidget {
  final MovieData movieInstanceData;

  const Purchase4View({super.key, required this.movieInstanceData});

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'use giftcard',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Switch(
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: AppColors.appBarBgColor,
                    activeTrackColor: Colors.red,
                    value: purchaseProvider.giftCardValue,
                    onChanged: (value) {
                      purchaseProvider.toggleGiftCardValue(value);
                    },
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
              child: Text(
                movieInstanceData.title.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 5, right: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    movieInstanceData.imageNetworkLink.toString(),
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'VILLAGE CINEMA WIEN MITTE\n\n',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          TextSpan(
                            text: 'TODAY 17:00, SCREEN 1\n\n',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          TextSpan(
                            text: '3D',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Selected Seats:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: purchaseProvider.selectedSeatList.length,
                itemBuilder: (context, index) {
                  return Text(
                    '${purchaseProvider.selectedSeatList[index]}, ',
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Ticket Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '₹ ${purchaseProvider.totalTicketAmount.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Snacks Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '₹ ${purchaseProvider.finalAmount.toString()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.red,
                      )),
                  const Text(
                    'Total Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '₹ ${purchaseProvider.totalTicketAmount + purchaseProvider.finalAmount}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Tickets purchased online cannot be changed or canceled and their value will not be refunded.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                'YES, I AGREE TO',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  const Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.3,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        purchaseProvider.togglePrivacyPolicyValue();
                      },
                      child: roundSelectionButton(
                          purchaseProvider.privacyPolicyValue)),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  const Text(
                    'Terms of Use',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationThickness: 1.3,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        purchaseProvider.toggleTermsOfUseValue();
                      },
                      child: roundSelectionButton(
                          purchaseProvider.termsOfUseValue)),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: GlobalWidgets.customButton(
          childWidget: Text(
            'BUY',
            style: TextStyle(
                color: (purchaseProvider.privacyPolicyValue != true ||
                        purchaseProvider.termsOfUseValue != true)
                    ? Colors.grey[700]
                    : Colors.white),
          ),
          color: (purchaseProvider.privacyPolicyValue != true ||
                  purchaseProvider.termsOfUseValue != true)
              ? AppColors.disableButtonColor
              : Colors.red,
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            final bool isLogin = prefs.containsKey('isLogin');
            if ((purchaseProvider.privacyPolicyValue == true &&
                purchaseProvider.termsOfUseValue == true)) {
              if (isLogin) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(MainScreenView.routeName,(route) => false,);
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Purchase5View(),
                ));
              }
            }
          },
        ),
      ),
    );
  }
}

Widget roundSelectionButton(bool selected) {
  return Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: selected ? Colors.red : AppColors.appBarBgColor,
      shape: BoxShape.circle,
      border: Border.all(width: 1, color: selected ? Colors.red : Colors.white),
    ),
    child: selected
        ? const Icon(
            Icons.done,
            color: Colors.white,
            size: 12,
          )
        : null,
  );
}
