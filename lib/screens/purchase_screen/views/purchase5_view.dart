import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/main_screen/views/main_screen_view.dart';
import 'package:flutter/material.dart';

class Purchase5View extends StatelessWidget {
  const Purchase5View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.appBarBgColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
        title: const Text(
          'Email',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                'Enter your email',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            GlobalWidgets.customTextFormField(),
            const Padding(
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 5),
              child: Text(
                'Please enter your e-mail address again',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            GlobalWidgets.customTextFormField(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'You are not logged in!\n',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text:
                          'Please enter your e-mail address to buy a ticket. We will send your ticket to this e-mail.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GlobalWidgets.customButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(MainScreenView.routeName,(route) => false,);
          },
          color: Colors.red,
          childWidget: const Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
