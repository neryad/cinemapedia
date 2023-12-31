import 'package:cinemapedia/config/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movidedb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/movidedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != "")
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/6/64/Poster_not_available.jpg',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != "")
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
          : 'no-poster',
      releaseDate:
          movieDB.releaseDate != null ? movieDB.releaseDate! : DateTime.now(),
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);

  static Movie movieDetailsToEntity(MovieDetails movieDB) => Movie(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != "")
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/6/64/Poster_not_available.jpg',
      genreIds: movieDB.genres.map((e) => e.name).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != "")
          ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
          : 'https://upload.wikimedia.org/wikipedia/commons/6/64/Poster_not_available.jpg',
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount);
}
