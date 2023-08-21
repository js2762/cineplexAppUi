import 'package:cineplex/models/movie_data.dart';
import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/screens/choose_date_screen/view/choose_date_screen.dart';
import 'package:cineplex/screens/choose_location_screen/view/choose_location_screen.dart';
import 'package:cineplex/screens/movie_detail_screen/movie_details_tab_view.dart';
import 'package:cineplex/screens/movie_detail_screen/showtimes_tab_view.dart';
import 'package:flutter/material.dart';

class MovieDetailScreenView extends StatelessWidget {
  const MovieDetailScreenView({super.key});

  static const routeName = '/MovieDetailScreenView';

  @override
  Widget build(BuildContext context) {
    final movieInstanceData =
        ModalRoute.of(context)!.settings.arguments as MovieData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Movie details',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
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
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
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
              Container(
                margin: const EdgeInsets.only(top: 5),
                //color: Colors.red,
                height: 205,
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.grey[900],
                      child: Center(
                        child: Icon(
                          Icons.play_circle,
                          size: 45,
                          color: Colors.grey[850],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.network(
                            movieInstanceData.imageNetworkLink.toString(),
                            height: 150,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${movieInstanceData.title}\n',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: movieInstanceData.runTime,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey
                                        //fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.star,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                    Text(
                      '0/10',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50),
                color: AppColors.appBarBgColor,
                child: TabBar(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  indicatorColor: Colors.red,
                  labelColor: Colors.white,
                  labelPadding: const EdgeInsets.all(10),
                  unselectedLabelColor: Colors.grey[700],
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Text('SHOWTIMES'),
                    Text('MOVIE DETAILS'),
                  ],
                ),
              ),
              SizedBox(
                height: 350,
                child: TabBarView(
                  children: [
                    ShowTimeTabView(movieInstanceData: movieInstanceData),
                    const MovieDetailsTabView(),
                  ],
                ),
              ),
              // TabBarView(
              //   children: [
              //     CircleAvatar(),
              //     CircleAvatar(),
              //     //ShowTimeTabView(),
              //     //MovieDetailScreenView(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
