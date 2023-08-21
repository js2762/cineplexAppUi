import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/choose_month_screen/provider/choose_month_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseMonthScreenView extends StatelessWidget {
  const ChooseMonthScreenView({super.key});

  static const routeName = '/ChooseMonthScreenView';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ChooseMonthProvider>(
      create: (context) => ChooseMonthProvider(),
      builder: (context, child) => const ChooseMonthScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final chooseMonthProvider = Provider.of<ChooseMonthProvider>(context);
    //chooseMonthProvider.calculateRemainingMonths();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBgColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text(
          'Choose month',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onTap: () {
                chooseMonthProvider.toggleAllMonthsValue();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All months',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  chooseMonthProvider.allMonthsValue
                      ? const Icon(
                          Icons.done,
                          color: Colors.red,
                          size: 20,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              DateTime.now().year.toString(),
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          chooseMonthProvider.allMonthsValue
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: chooseMonthProvider.remainingMonths.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.grey[850],
                          thickness: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            chooseMonthProvider.selectIndex(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              chooseMonthProvider.remainingMonths[index],
                              style: TextStyle(
                                color:
                                    (chooseMonthProvider.selectedIndex == index)
                                        ? Colors.red
                                        : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.grey[850],
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        chooseMonthProvider
                            .monthNames[DateTime.now().month - 1],
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
