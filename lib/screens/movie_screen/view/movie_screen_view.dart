import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/movie_screen/provider/movie_screen_provider.dart';
import 'package:cineplex/screens/movie_screen/view/now_playing_tab_view.dart';
import 'package:cineplex/screens/movie_screen/view/recommended_tab_view.dart';
import 'package:cineplex/screens/movie_screen/view/upcoming_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieScreenView extends StatelessWidget {
  const MovieScreenView({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<MovieScreenProvider>(
      create: (context) => MovieScreenProvider(),
      builder: (context, child) => const MovieScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBarBgColor,
          title: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'CINEPLEXX\n',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                TextSpan(
                  text: 'MOVIES',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: TabBar(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              unselectedLabelColor: Colors.grey[700],
              labelColor: Colors.white,
              indicatorColor: Colors.red,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(bottom: 10),
              tabs: const [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('RECOMMENDED'),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('NOW PLAYING'),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('UPCOMING'),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            RecommendedTabView(),
            NowPlayingTabView(),
            UpcomingTabView(),
          ],
        ),
      ),
    );
  }
}
