import '../entities/actor.dart';

abstract class ActorRepository {
  Future<List<Actor>> getActorsByMovies(String movieId);
}
