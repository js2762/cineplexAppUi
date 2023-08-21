import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/location_screen/view/location_screen_view.dart';
import 'package:cineplex/screens/main_screen/provider/main_screen_provider.dart';
import 'package:cineplex/screens/movie_screen/view/movie_screen_view.dart';
import 'package:cineplex/screens/search_screen/view/search_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  static const routeName = '/MainScreenView';

  @override
  Widget build(BuildContext context) {
    final mainScreenProvider = Provider.of<MainScreenProvider>(context);
    return Scaffold(
      body: IndexedStack(
        index: mainScreenProvider.bottomNavigationBarIndex,
        children: [
          MovieScreenView.builder(context),
          const LocationScreenView(),
          const SearchScreenView(),
          const Center(
            child: Text(
              'wishlist',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Center(
            child: Text(
              'person',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainScreenProvider.bottomNavigationBarIndex,
        backgroundColor: AppColors.appBarBgColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          mainScreenProvider.bottomNavigationBarOnTap(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_creation_rounded,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_sharp,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.recommend_rounded,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
