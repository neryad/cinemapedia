import 'package:cinemapedia/config/domain/data-sources/movies_datasource.dart';
import 'package:cinemapedia/config/domain/entities/movie.dart';

import '../../config/domain/repositories/movies_repositories.dart';

class MovieRepositoryImplementation extends MoviesRepository {
  final MoviesDataSource dataSource;

  MovieRepositoryImplementation(this.dataSource);
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataSource.getNowPlaying(page: page);
  }
}
