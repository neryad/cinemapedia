import 'package:cinemapedia/config/domain/data-sources/actors_datasrouce.dart';
import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/config/domain/repositories/actors_repository.dart';

class ActorRepositoryImplementation extends ActorRepository {
  final ActorsDataSource datasource;
  ActorRepositoryImplementation(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovies(String movieId) {
    return datasource.getActorsByMovies(movieId);
  }
}
