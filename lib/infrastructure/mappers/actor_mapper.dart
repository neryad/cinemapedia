import 'package:cinemapedia/config/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/movidedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500/${cast.profilePath}'
          : 'https://yt3.googleusercontent.com/79jQvzf0fQ91zEKt5kBjYOO9Epnmw92_Sw_XQ4NgoUsoMPNjAsQNncN85S2JPep2i7tkuvnibzo=s900-c-k-c0x00ffffff-no-rj',
      character: cast.character);
}
