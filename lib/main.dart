import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movies/data/core/api_client.dart';
import 'package:movies/data/data_sources/movie_remote_data_sources.dart';
import 'package:movies/data/repositories/movie_repository_impl.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/entities/no_params.dart';
import 'package:movies/domain/repositories/movie_repositories.dart';
import 'package:movies/domain/usecases/get_trending.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
