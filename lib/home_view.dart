import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondaniatedgallery/animated_page.dart';
import 'package:secondaniatedgallery/image_slider.dart';
import 'package:secondaniatedgallery/movie.dart';
import 'package:secondaniatedgallery/movie_button.dart';
import 'package:secondaniatedgallery/movie_detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Movies> movies = [];
  late PageController _pageController;
  int currentIdenx = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = rawData
        .map((data) => Movies(
              title: data['title'],
              image: data['image'],
              index: data['index'],
            ))
        .toList();
    _pageController =
        PageController(viewportFraction: 0.8, initialPage: currentIdenx)
          ..addListener(() {
            setState(() {
              pageValue = _pageController.page!;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final reversedMoviesList = movies.reversed.toList();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Stack(
              children: reversedMoviesList
                  .map((movie) => ImageSlider(
                      index: movie.index! - 1,
                      image: movie.image!,
                      pageValue: pageValue))
                  .toList(),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.white],
                      stops: [0.3, 0.8])),
            ),
            Animated(
              pageController: _pageController,
              pageValue: pageValue,
              child: (index, _) {
                return MovieDetails(movies: movies[index]);
              },
              pageCount: movies.length,
              onPageChangeCallBack: (index) {
                setState(
                  () {
                    currentIdenx = index;
                  },
                );
              },
            ),
            const Positioned(
                bottom: 32, left: 0, right: 0, child: MovieButtonn()),
          ],
        ),
      ),
    );
  }
}
