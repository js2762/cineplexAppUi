import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/app_images.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/auth/signup/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SignUp2View extends StatelessWidget {
  const SignUp2View({super.key});

  void _displayModalBottomSheet(
      BuildContext context, SignUpProvider signUpProvider) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.appBarBgColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 4,
                blurRadius: 4,
              )
            ],
          ),
          height: 160,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Choose gender',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: signUpProvider.bottomSheet.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        signUpProvider.selectBottomSheetValue(index);
                      },
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.grey[800],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              signUpProvider.bottomSheet[index],
                              style: TextStyle(
                                color: signUpProvider.selectedBottomSheetVal ==
                                        index
                                    ? Colors.red
                                    : Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.grey[800],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
                'OPTIONAL INFORMATION',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            globalText('Date of Birth'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(
                readOnlyValue: true,
                hintText: signUpProvider.selectedDate ?? 'Choose',
                hintTextColor: Colors.grey,
                suffixIconData: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 30,
                ),
                onPressedSuffixIcon: () async {
                  await picker.DatePicker.showDatePicker(
                    context,
                    theme: picker.DatePickerTheme(
                      cancelStyle: const TextStyle(color: Colors.red),
                      doneStyle: const TextStyle(color: Colors.red),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      headerColor: AppColors.appBarBgColor,
                      itemStyle: const TextStyle(color: Colors.white),
                    ),
                    onConfirm: (time) {
                      DateFormat formatDate = DateFormat('dd-MM-yyyy');
                      String selectedDate = formatDate.format(time);
                      signUpProvider.selectDate(selectedDate);
                    },
                  );
                },
              ),
            ),
            globalText('Gender'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(
                onPressedSuffixIcon: () {
                  _displayModalBottomSheet(context, signUpProvider);
                },
                readOnlyValue: true,
                hintText: signUpProvider.genderVal ?? 'Choose',
                hintTextColor: Colors.grey,
                suffixIconData: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
            globalText('Mobile Number'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('Country'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('Address'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('ZIP Code'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            globalText('City'),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: GlobalWidgets.customTextFormField(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: GlobalWidgets.customButton(
                childWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                        AppImages.facebookIcon,
                        height: 25,
                      ),
                    ),
                    const Text(
                      'CONNECT WITH FACEBOOK',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                color: AppColors.facebookColor,
              ),
            ),
            SizedBox(
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
            ),
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
