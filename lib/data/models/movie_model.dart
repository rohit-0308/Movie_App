import 'package:movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final String overview;
  final int id;
  final String title;
  final String releaseDate;
  final bool adult;
  final String backdropPath;
  final double popularity;
  final String mediaType;

  MovieModel({
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.id,
    this.title,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          title: title,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        genreIds: json['genre_ids'].cast<int>(),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        posterPath: json['poster_path'],
        video: json['video'],
        voteAverage: json['vote_average']?.toDouble() ??
            0.0, //if INT is returned from the API
        voteCount: json['vote_count'],
        overview: json['overview'],
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        popularity: json['popularity']?.toDouble() ?? 0.0,
        mediaType: json['media_type']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['overview'] = this.overview;
    data['id'] = this.id;
    data['title'] = this.title;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
