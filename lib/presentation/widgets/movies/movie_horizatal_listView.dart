import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_format.dart';
import 'package:flutter/material.dart';

import '../../../config/domain/entities/movie.dart';

class MovieHorizontalListView extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;
  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: Column(children: [
        if (title != null || subtitle != null)
          _Tittle(
            title: title,
            subTitle: subtitle,
          ),
        Expanded(
            child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _Slide(movie: movies[index]);
          },
        ))
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  width: 150,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                style: textStyle.titleSmall,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  '${movie.voteAverage}',
                  style: textStyle.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade800),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  HumanFormats.number(movie.popularity),
                  style: textStyle.bodySmall,
                )
              ],
            )
          ],
        ));
  }
}

class _Tittle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Tittle({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null)
          Text(
            title!,
            style: titleStyle,
          ),
        const Spacer(),
        if (title != null)
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: () {},
            child: Text(
              subTitle!,
            ),
          ),
      ]),
    );
  }
}
