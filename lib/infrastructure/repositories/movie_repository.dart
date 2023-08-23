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

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataSource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataSource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return dataSource.getMovieById(id);
  }
}
