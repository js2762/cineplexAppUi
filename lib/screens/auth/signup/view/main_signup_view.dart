import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/auth/signup/signup_provider.dart';
import 'package:cineplex/screens/auth/signup/view/signup1_view.dart';
import 'package:cineplex/screens/auth/signup/view/signup2_view.dart';
import 'package:cineplex/screens/auth/signup/view/signup3_view.dart';
import 'package:cineplex/screens/auth/signup/view/signup4_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/SignUpView';

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBgColor,
        leading: IconButton(
          onPressed: () {
            signUpProvider.navigateBackToPage(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Create your account',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            padding: const EdgeInsets.only(top: 3),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: List.generate(
                4,
                (index) => Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.only(right: 4),
                    color: index <= signUpProvider.selectedPage
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
        index: signUpProvider.selectedPage,
        children: const [
          SignUp1View(),
          SignUp2View(),
          SignUp3View(),
          SignUp4View(),
        ],
      ),
    );
  }
}
