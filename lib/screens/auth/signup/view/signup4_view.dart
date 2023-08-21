import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/auth/signup/signup_provider.dart';
import 'package:cineplex/screens/auth/signup/view/final_signup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp4View extends StatelessWidget {
  const SignUp4View({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);
    bool allSelectedVal = (signUpProvider.policyButtonVal &&
        signUpProvider.termsButtonVal &&
        signUpProvider.bonusCardTermsVal &&
        signUpProvider.usageDataVal);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
            child: Text(
              'YES, I AGREE TO',
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
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                globalText('Privacy Policy'),
                InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    signUpProvider.policyButtonAction();
                  },
                  child: roundSelectionButton(signUpProvider.policyButtonVal),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                globalText('Terms of Use'),
                InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    signUpProvider.termsButtonAction();
                  },
                  child: roundSelectionButton(signUpProvider.termsButtonVal),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                globalText('Terms of Use for Bonuscard'),
                GestureDetector(
                  onTap: () {
                    signUpProvider.bonusCardTermsAction();
                  },
                  child: roundSelectionButton(signUpProvider.bonusCardTermsVal),
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
                  'Facebook - Collect app usage data',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 35,
                  child: Switch(
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: AppColors.appBarBgColor,
                    activeTrackColor: Colors.red,
                    value: signUpProvider.usageDataVal,
                    onChanged: (value) {
                      signUpProvider.usageDataAction(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
            width: double.infinity,
            child: GlobalWidgets.customButton(
              childWidget: Text(
                'CREATE ACCOUNT',
                style: TextStyle(
                    color: allSelectedVal ? Colors.white : Colors.grey),
              ),
              color: allSelectedVal ? Colors.red : AppColors.disableButtonColor,
              onPressed: () {
                if (allSelectedVal) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    FinalSignUpView.routeName,
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget globalText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 14,
      decoration: TextDecoration.underline,
      decorationColor: Colors.white,
      decorationThickness: 1.3,
    ),
  );
}

Widget roundSelectionButton(bool selected) {
  return Container(
    height: 20,
    width: 20,
    decoration: BoxDecoration(
      color: selected ? Colors.red : AppColors.appBarBgColor,
      shape: BoxShape.circle,
      border: Border.all(width: 1, color: Colors.white),
    ),
  );
}
