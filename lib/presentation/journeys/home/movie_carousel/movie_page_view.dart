import 'package:flutter/material.dart';
import 'package:movies/common/constants/size_constraints.dart';
import 'package:movies/common/screenUtil/screenutil.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/presentation/journeys/home/movie_carousel/movie_card_widget.dart';
import 'package:movies/common/extensions/size_extension.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key key,
    @required this.movies,
    @required this.initialPage,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);
  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      //  height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return MovieCardWidget(
            movieId: movie.id,
            posterPath: movie.posterPath,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {},
      ),
    );
  }
}
