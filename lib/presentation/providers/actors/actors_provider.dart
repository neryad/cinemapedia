import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/domain/entities/movie.dart';
import 'actor_repository_provider.dart';

final actorByMoviesProvider =
    StateNotifierProvider<ActorByMoviesNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorRepository = ref.watch(actorRepositoryProvider);

  return ActorByMoviesNotifier(
      getActor: actorRepository.datasource.getActorsByMovies);
});

typedef GetActorCallBack = Future<List<Actor>> Function(String movieId);

class ActorByMoviesNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorCallBack getActor;
  ActorByMoviesNotifier({required this.getActor}) : super({});

  Future<void> loadActor(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActor(movieId);
    state = {...state, movieId: actors};
  }
}
