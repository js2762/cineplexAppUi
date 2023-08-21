import 'package:cineplex/models/movie_data.dart';
import 'package:cineplex/services/services.dart';
import 'package:flutter/material.dart';

class MovieScreenProvider with ChangeNotifier {
  ApiServices apiServicesObject = ApiServices();
  List<MovieData> _finalMovieDataList = [];
  List<MovieData> searchedMovieDataList = [];
  bool isLoaded = true;

  List<MovieData> get getFinalMovieDataList {
    return [..._finalMovieDataList];
  }

  MovieScreenProvider() {
    getMovieDataList();
  }

  Future<void> getMovieDataList() async {
    Future<List<dynamic>> getResponse = apiServicesObject.getMovieData();
    List<dynamic> responseData = await getResponse;
    List<MovieData> movieDataList = [];
    for (var element in responseData) {
      if (element['Poster'] != null) {
        movieDataList.add(
          MovieData(
            title: element['Title'],
            year: element['Year'],
            runTime: element['Runtime'],
            imageNetworkLink: element['Poster'],
          ),
        );
      }
    }
    _finalMovieDataList = movieDataList;
    searchedMovieDataList = movieDataList;
    //print(_finalMovieDataList);
    isLoaded = false;
    notifyListeners();
  }

  void searchingMovieItem(String value) {
   // print(value);
    if (value.isNotEmpty) {
      searchedMovieDataList = _finalMovieDataList
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else if (value == ''){
      searchedMovieDataList = [..._finalMovieDataList];
    }
   // print(searchedMovieDataList);
    notifyListeners();
  }
}
