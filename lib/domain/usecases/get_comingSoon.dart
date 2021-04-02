import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/app_error.dart';
import 'package:movies/domain/entities/movie_entity.dart';
import 'package:movies/domain/entities/no_params.dart';
import 'package:movies/domain/repositories/movie_repositories.dart';
import 'package:movies/domain/usecases/usecase.dart';

class GeTComingSoon extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GeTComingSoon(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getComingSoon();
  }
}
