import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/entities/no_params.dart';
import 'package:movies/domain/usecases/get_trending.dart';
import 'package:pedantic/pedantic.dart';
import 'dependency_injections(di)/get_it.dart' as getIt;

void main() async {
  unawaited(getIt.init());
  GetTrending getTrending = getIt.getItInstance<GetTrending>();
  final Either<AppError, List<MovieEntity>> eitherRespone =
      await getTrending(NoParams());
  eitherRespone.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('List of Movies');
    print(r);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.red,
      ),
    );
  }
}
