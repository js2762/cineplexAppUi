import 'package:cineplex/screens/choose_month_screen/view/choose_month_screen.dart';
import 'package:cineplex/screens/movie_detail_screen/movie_detail_screen.dart';
import 'package:cineplex/screens/movie_screen/provider/movie_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingTabView extends StatelessWidget {
  const UpcomingTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDataList =
        Provider.of<MovieScreenProvider>(context).getFinalMovieDataList.reversed.toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: () {
              Navigator.of(context).pushNamed(ChooseMonthScreenView.routeName);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                Text(
                  'All months',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                )
              ],
            ),
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
