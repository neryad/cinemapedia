import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/shared/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowPlayingMoviesSlide = ref.watch(moviesSlideShowProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
          MoviesSlideShow(movies: nowPlayingMoviesSlide),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'lunes 20',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'lunes 20',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subtitle: 'En este mes',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Populares',
            //subtitle: 'lunes 20',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'Mejor calificados',
            subtitle: 'De simpre',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          )
        ],
      ),
    );
  }
}
