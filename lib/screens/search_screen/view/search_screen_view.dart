import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/app_images.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/movie_screen/provider/movie_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieScreenProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBgColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              AppImages.filterIcon,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
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
                text: 'SEARCH',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
            height: 35,
            child: GlobalWidgets.customTextFormField(
              onChanged: (value) => movieProvider.searchingMovieItem(value),
              prefixIconData: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              contentPaddingValue: 0,
              hintText: 'Search by title',
              hintTextColor: Colors.grey,
            ),
          ),
          Divider(
            color: Colors.grey[850],
            thickness: 2,
          ),
          movieProvider.searchedMovieDataList.isEmpty
              ? const Text(
                  "No match found.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: movieProvider.searchedMovieDataList.length,
                    itemBuilder: (context, index) {
                      bool lastItem = index ==
                          movieProvider.searchedMovieDataList.length - 1;
                      return Padding(
                        padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                            bottom: lastItem ? 20 : 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Image.network(
                                movieProvider.searchedMovieDataList[index]
                                    .imageNetworkLink
                                    .toString(),
                                height: 170,
                              ),
                            ),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${movieProvider.searchedMovieDataList[index].title}\n',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const WidgetSpan(
                                        child: SizedBox(
                                          height: 20,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${movieProvider.searchedMovieDataList[index].year}\n',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const WidgetSpan(
                                        child: SizedBox(
                                          height: 20,
                                        ),
                                      ),
                                      TextSpan(
                                        text: movieProvider
                                            .searchedMovieDataList[index]
                                            .runTime,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const WidgetSpan(
                                        child: SizedBox(
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
