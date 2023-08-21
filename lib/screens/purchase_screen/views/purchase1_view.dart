import 'package:cineplex/models/movie_data.dart';
import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchase1View extends StatelessWidget {
  final MovieData movieInstanceData;

  const Purchase1View({super.key, required this.movieInstanceData});

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Want to use your Bonus Card?',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
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
                    'Adult',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      purchaseProvider.adultCountDecrement();
                    },
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      purchaseProvider.adultCountValue.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      purchaseProvider.adultCountIncrement();
                    },
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Row(
                children: [
                  const Text(
                    'Reduced',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.help,color: Colors.white,size: 20,)),
                  const Spacer(),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {
                      purchaseProvider.childrenCountDecrement();
                    },
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      purchaseProvider.childrenCountValue.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {
                      purchaseProvider.childrenCountIncrement();
                    },
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.add,
                        size: 15,
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: GlobalWidgets.customButton(
          childWidget: Text(
            'NEXT STEP',
            style: TextStyle(
              color: (purchaseProvider.adultCountValue != 0 ||
                  purchaseProvider.childrenCountValue != 0) ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          color: (purchaseProvider.adultCountValue != 0 ||
                  purchaseProvider.childrenCountValue != 0)
              ? Colors.red
              : AppColors.disableButtonColor,
          onPressed: () {
            if ((purchaseProvider.adultCountValue != 0 ||
                purchaseProvider.childrenCountValue != 0)) {
              purchaseProvider.navigateToNextPage();
            }
          },
        ),
      ),
    );
  }
}
