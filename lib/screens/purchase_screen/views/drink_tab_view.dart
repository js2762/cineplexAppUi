import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrinkTabView extends StatelessWidget {
  const DrinkTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final purchaseProvide = Provider.of<PurchaseProvider>(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: purchaseProvide.drinkList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 20,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: [
                Container(
                  width: 170,
                  decoration: BoxDecoration(
                    color: AppColors.gridCardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          purchaseProvide.drinkList[index].name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          purchaseProvide.drinkList[index].imagePath.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '₹ ${purchaseProvide.drinkList[index].price}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '₹ ${purchaseProvide.drinkList[index].quantity}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        purchaseProvide.countDrinkDecrement(purchaseProvide.drinkList[index].name.toString());
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
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        purchaseProvide.drinkList[index].count.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        purchaseProvide.countDrinkIncrement(purchaseProvide.drinkList[index].name.toString());
                      },
                      child: const CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.add,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
