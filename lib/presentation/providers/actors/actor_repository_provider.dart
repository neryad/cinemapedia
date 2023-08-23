//Este repo es inmutable solo lectura
import 'package:cinemapedia/config/domain/data-sources/actors_datasrouce.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasource/actor_movieDb_datasource.dart';
import '../../../infrastructure/repositories/actor_repository_impl.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImplementation(ActorDataDbDatasource());
});
