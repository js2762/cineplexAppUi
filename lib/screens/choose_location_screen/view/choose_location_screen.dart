import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/choose_location_screen/provider/choose_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChooseLocationScreenView extends StatelessWidget {
  const ChooseLocationScreenView({super.key});

  static const routeName = 'ChooseLocationScreenView';

  @override
  Widget build(BuildContext context) {
    final chooseLocationProvider = Provider.of<ChooseLocationProvider>(context);
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
          'Choose location',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Divider(
              height: 0,
              color: Colors.grey[850],
              thickness: 2,
            ),
          ),
          const ListTile(
            tileColor: AppColors.listTileColor,
            leading: Text(
              'All states',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            trailing: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 20,
            ),
          ),
          Divider(
            height: 0,
            color: Colors.grey[850],
            thickness: 2,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: chooseLocationProvider.stateList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  chooseLocationProvider.selectState(index);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
                      child: Text(
                        chooseLocationProvider.stateList[index],
                        style: TextStyle(color: (chooseLocationProvider.selectedStateIndex == index) ? Colors.red : Colors.white),
                      ),
                    ),
                    Divider(
                      height: 0,
                      color: Colors.grey[850],
                      thickness: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
