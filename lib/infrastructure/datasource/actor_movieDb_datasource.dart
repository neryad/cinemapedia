import 'package:cinemapedia/config/domain/data-sources/actors_datasrouce.dart';
import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movidedb/credits_response.dart';
import 'package:dio/dio.dart';

import '../../config/constants/enviroemnt.dart';

class ActorDataDbDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX'
      }));
  @override
  Future<List<Actor>> getActorsByMovies(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
