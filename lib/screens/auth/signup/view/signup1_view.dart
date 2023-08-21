import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/auth/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp1View extends StatelessWidget {
  const SignUp1View({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'MANDATORY INFORMATION',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            globalText('First Name'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('Last Name'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('Favourite Cinema'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(
                hintText: 'Choose',
                hintTextColor: Colors.grey,
                suffixIconData: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
            globalText('Email'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('Password'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(
                suffixIconData: const Icon(
                  Icons.visibility_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
            globalText('Repeat Password'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(
                suffixIconData: const Icon(
                  Icons.visibility_rounded,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: double.infinity,
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
      ),
    );
  }
}

Widget globalText(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, bottom: 5),
    child: Text(
      text,
      style: const TextStyle(color: Colors.grey, fontSize: 14),
    ),
  );
}
