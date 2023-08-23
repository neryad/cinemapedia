import '../entities/actor.dart';

abstract class ActorsDataSource {
  Future<List<Actor>> getActorsByMovies(String movieId);
}
