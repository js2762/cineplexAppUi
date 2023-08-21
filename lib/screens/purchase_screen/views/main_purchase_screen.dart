import 'package:cineplex/models/movie_data.dart';
import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:cineplex/screens/purchase_screen/views/purchase1_view.dart';
import 'package:cineplex/screens/purchase_screen/views/purchase2_view.dart';
import 'package:cineplex/screens/purchase_screen/views/purchase3_view.dart';
import 'package:cineplex/screens/purchase_screen/views/purchase4_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPurchaseScreenView extends StatelessWidget {
  const MainPurchaseScreenView({super.key});

  static const routeName = 'MainPurchaseScreenView';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PurchaseProvider>(
      create: (context) => PurchaseProvider(),
      builder: (context, child) => const MainPurchaseScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movieInstanceData =
        ModalRoute.of(context)!.settings.arguments as MovieData;
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBgColor,
        leading: IconButton(
          onPressed: () {
            purchaseProvider.navigateBackToPage(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          purchaseProvider.appBarText(),
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(8),
          child: Container(
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.only(right: 4),
                    color: index <= purchaseProvider.selectedPage
                        ? AppColors.lineBarColor
                        : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: purchaseProvider.selectedPage,
        children: [
          Purchase1View(movieInstanceData: movieInstanceData),
          const Purchase2View(),
          const Purchase3View(),
          Purchase4View(movieInstanceData: movieInstanceData),
        ],
      ),
    );
  }
}
