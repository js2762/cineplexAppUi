import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:cineplex/screens/purchase_screen/views/drink_tab_view.dart';
import 'package:cineplex/screens/purchase_screen/views/snack_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchase3View extends StatelessWidget {
  const Purchase3View({super.key});

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.appBarBgColor,
          title: SizedBox(
            height: 53,
            child: TabBar(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              unselectedLabelColor: Colors.grey[700],
              labelColor: Colors.white,
              indicatorColor: Colors.red,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(bottom: 10),
              tabs: const [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('SNACKS'),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('DRINK'),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            SnackTabView(),
            DrinkTabView(),
          ],
        ),
        floatingActionButton: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: GlobalWidgets.customButton(
            childWidget: const Text(
              'NEXT',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            color: Colors.red,
            onPressed: () {
              purchaseProvider.navigateToNextPage();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: AnimatedContainer(
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 300),
          decoration: const BoxDecoration(
              color: AppColors.appBarBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),),
          curve: Curves.easeInOut,
          height: purchaseProvider.containerHeight,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        'Check order details',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: GestureDetector(
                        onTap: () {
                          purchaseProvider.toggleContainer();
                          // if (purchaseProvider.isExpanded) {
                          //   purchaseProvider.orderedSnackDrink();
                          // }
                        },
                        child: purchaseProvider.isExpanded
                            ? const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Ordered Snacks & Cold-Drinks:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: purchaseProvider.orderedSnackList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${purchaseProvider.orderedSnackList[index].name}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '${purchaseProvider.orderedSnackList[index].count}  x  ₹ ${purchaseProvider.orderedSnackList[index].price}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          },
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: purchaseProvider.orderedColdDrinkList.length,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${purchaseProvider.orderedColdDrinkList[index].name}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '${purchaseProvider.orderedColdDrinkList[index].count}  x  ₹ ${purchaseProvider.orderedColdDrinkList[index].price}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          },
                        ),
                      ],

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total amount:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${purchaseProvider.finalAmount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
