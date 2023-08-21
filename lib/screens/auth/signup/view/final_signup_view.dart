import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/app_images.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/main_screen/views/main_screen_view.dart';
import 'package:flutter/material.dart';

class FinalSignUpView extends StatelessWidget {
  const FinalSignUpView({super.key});

  static const routeName = '/FinalSignUpView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBgColor,
        title: const Text(
          'Account created',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset(
                  AppImages.checkedIcon,
                  height: 40,
                ),
              ),
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'YOU SUCCESSFULLY CREATED YOUR ACCOUNT',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FittedBox(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'To finalize the registration you need to activate this\n',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        TextSpan(
                          text: 'new account.\n',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        const WidgetSpan(
                          child: SizedBox(
                            height: 20,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Please, check your mail box and follow instructions.',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: GlobalWidgets.customButton(
          childWidget: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
          },
        ),
      ),
    );
  }
}
