import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/auth/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp3View extends StatelessWidget {
  const SignUp3View({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
            child: Text(
              'INFO-SERVICES',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Text(
              'Receive up-to-date customized information on the most important films, highlights and promotion in your Cineplexx.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Receive Push-notifications',
                  style: TextStyle(color: Colors.white),
                ),
                Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.appBarBgColor,
                  activeTrackColor: Colors.red,
                  value: signUpProvider.pushNotificationSwitchVal,
                  onChanged: (value) {
                    signUpProvider.pushNotificationAction(value);
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Weekly newsletter, movie tips & promotions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.appBarBgColor,
                  activeTrackColor: Colors.red,
                  value: signUpProvider.switch2Val,
                  onChanged: (value) {
                    signUpProvider.switch2Action(value);
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Family film club and children's actions",
                  style: TextStyle(color: Colors.white),
                ),
                Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.appBarBgColor,
                  activeTrackColor: Colors.red,
                  value: signUpProvider.actionSwitchVal,
                  onChanged: (value) {
                    signUpProvider.switchAction(value);
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Opera",
                  style: TextStyle(color: Colors.white),
                ),
                Switch(
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: AppColors.appBarBgColor,
                  activeTrackColor: Colors.red,
                  value: signUpProvider.operaSwitchVal,
                  onChanged: (value) {
                    signUpProvider.operaSwitchAction(value);
                  },
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 80),
            child: GlobalWidgets.customButton(
              childWidget: const Text(
                'NEXT STEP',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              onPressed: () {
                signUpProvider.navigateToNextPage();
              },
            ),
          )
        ],
      ),
    );
  }
}
