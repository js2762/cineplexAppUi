import 'package:cineplex/screens/choose_date_screen/view/choose_date_screen.dart';
import 'package:cineplex/screens/choose_location_screen/view/choose_location_screen.dart';
import 'package:cineplex/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:cineplex/screens/movie_screen/provider/movie_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendedTabView extends StatelessWidget {
  const RecommendedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDataList = Provider.of<MovieScreenProvider>(context)
        .getFinalMovieDataList
        .reversed
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ChooseLocationScreenView.routeName);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      'All states',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ChooseDateScreenView.routeName);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    Text(
                      'Today',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[850],
          thickness: 2,
        ),
        Provider.of<MovieScreenProvider>(context).isLoaded
            ? const Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              )
            : Expanded(
                child: GridView.builder(
                  itemCount: movieDataList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      overlayColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          MovieDetailScreenView.routeName,
                          arguments: movieDataList[index],
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Image.network(
                          movieDataList[index].imageNetworkLink.toString(),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  },
                ),
              ),
      ],
    );
  }
}
