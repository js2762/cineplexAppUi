import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/auth/signin/signin_provider.dart';
import 'package:cineplex/screens/auth/signin/view/signin_view.dart';
import 'package:cineplex/screens/auth/signup/signup_provider.dart';
import 'package:cineplex/screens/auth/signup/view/final_signup_view.dart';
import 'package:cineplex/screens/auth/signup/view/main_signup_view.dart';
import 'package:cineplex/screens/choose_date_screen/provider/choose_date_provider.dart';
import 'package:cineplex/screens/choose_date_screen/view/choose_date_screen.dart';
import 'package:cineplex/screens/choose_location_screen/provider/choose_location_provider.dart';
import 'package:cineplex/screens/choose_location_screen/view/choose_location_screen.dart';
import 'package:cineplex/screens/choose_month_screen/view/choose_month_screen.dart';
import 'package:cineplex/screens/main_screen/provider/main_screen_provider.dart';
import 'package:cineplex/screens/main_screen/views/main_screen_view.dart';
import 'package:cineplex/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:cineplex/screens/movie_screen/provider/movie_screen_provider.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:cineplex/screens/purchase_screen/views/main_purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SignInProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SignUpProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MainScreenProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MovieScreenProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ChooseLocationProvider(),
        ),
        ChangeNotifierProvider.value(
          value: ChooseDateProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PurchaseProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cineplex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.bgColor,
        ),
        home: const SignInView(),
        routes: {
          MainScreenView.routeName: (context) => const MainScreenView(),
          SignUpView.routeName: (context) => const SignUpView(),
          FinalSignUpView.routeName: (context) => const FinalSignUpView(),
          MovieDetailScreenView.routeName: (context) =>
              const MovieDetailScreenView(),
          ChooseMonthScreenView.routeName: (context) =>
              ChooseMonthScreenView.builder(context),
          ChooseLocationScreenView.routeName: (context) =>
              const ChooseLocationScreenView(),
          ChooseDateScreenView.routeName: (context) =>
              const ChooseDateScreenView(),
          MainPurchaseScreenView.routeName: (context) =>
              MainPurchaseScreenView.builder(context),
        },
      ),
    );
  }
}
