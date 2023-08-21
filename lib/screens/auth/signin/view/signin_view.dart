import 'package:cineplex/resources/app_images.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/auth/signin/signin_provider.dart';
import 'package:cineplex/screens/auth/signup/view/main_signup_view.dart';
import 'package:cineplex/screens/main_screen/views/main_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    AppImages.appIcon,
                    height: 70,
                  ),
                ),
                const Center(
                  child: Text(
                    'CINEPLEXX',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, bottom: 5),
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                GlobalWidgets.customTextFormField(
                  hintText: 'abc@gmail.com',
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, bottom: 5),
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                GlobalWidgets.customTextFormField(
                  hintText: 'password',
                  obsecureText: signInProvider.visibilityValue,
                  suffixIconData: signInProvider.visibilityValue
                      ? const Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility_rounded,
                          color: Colors.grey,
                        ),
                  onPressedSuffixIcon: () {
                    signInProvider.toggleVisibility();
                  },
                  // iconColor: Colors.grey
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding:
                      const EdgeInsets.only(top: 15, bottom: 15, right: 10),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: GlobalWidgets.customButton(
                    childWidget: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.red,
                    onPressed: () async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLogin', true);
                      Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: GlobalWidgets.customButton(
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Image.asset(
                            AppImages.appleIcon,
                            height: 20,
                          ),
                        ),
                        const Text(
                          'Sign in with Apple',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GlobalWidgets.customButton(
                        childWidget: const Text(
                          'No Cineplexx Member?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(MainScreenView.routeName);
                        },
                      ),
                      GlobalWidgets.customButton(
                        childWidget: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(SignUpView.routeName);
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GlobalWidgets.customButton(
                    childWidget: const Text(
                      'REFUND TICKETS?',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
