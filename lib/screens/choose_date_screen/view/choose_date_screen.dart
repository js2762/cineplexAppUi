import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/choose_date_screen/provider/choose_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChooseDateScreenView extends StatefulWidget {
  const ChooseDateScreenView({super.key});

  static const routeName = 'ChooseDateScreenView';

  @override
  State<ChooseDateScreenView> createState() => _ChooseDateScreenViewState();
}

class _ChooseDateScreenViewState extends State<ChooseDateScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero).then((value) =>
        Provider.of<ChooseDateProvider>(context, listen: false).updateDates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chooseDateProvider = Provider.of<ChooseDateProvider>(context);
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
          'Choose a date',
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: chooseDateProvider.datesToShow.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        chooseDateProvider.selectDay(index);
                      },
                      leading: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${chooseDateProvider.datesToShow[index].day}\n',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: (chooseDateProvider.selectedDayIndex ==
                                        index)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: DateFormat('MMM')
                                  .format(chooseDateProvider.datesToShow[index])
                                  .toUpperCase(),
                              style: TextStyle(
                                fontSize: 14,
                                color: (chooseDateProvider.selectedDayIndex ==
                                        index)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      title: Text(
                        DateFormat('EEEE')
                            .format(chooseDateProvider.datesToShow[index]),
                        style: TextStyle(
                          color: (chooseDateProvider.selectedDayIndex == index)
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                      trailing: (chooseDateProvider.selectedDayIndex == index)
                          ? const Icon(
                              Icons.done,
                              color: Colors.red,
                              size: 20,
                            )
                          : null,
                    ),
                    Divider(
                      height: 0,
                      color: Colors.grey[850],
                      thickness: 2,
                    ),
                  ],
                );
              },
            ),
            Divider(
              height: 0,
              color: Colors.grey[850],
              thickness: 2,
            ),
            InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onTap: () {
                chooseDateProvider.toggleViewDays();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 5),
                padding: const EdgeInsets.only(
                    top: 2, bottom: 2, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: chooseDateProvider.showNext14Days
                    ? const Text(
                        'SHOW LESS',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        'SHOW MORE',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            Divider(
              color: Colors.grey[850],
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
