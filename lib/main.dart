import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/common/data/api_client.dart';
import 'package:movies/features/home/data/repositories/movies_repository.dart';

import 'common/data/constants/app_constants.dart';
import 'features/favorites/domain/cubit/favorites_cubit.dart';
import 'features/favorites/presentation/pages/favorites_page.dart';
import 'features/home/domain/bloc/movies_bloc.dart';
import 'features/home/domain/bloc/movies_event.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/home/presentation/pages/movie_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Hive.registerAdapter(FavoritesAdapter());
  //Hive.registerAdapter(MovieAdapter());
  //await Hive.openBox<Favorites>(Favorites.boxName);
  //await Hive.openBox<Movie>(Movie.boxName);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesBloc(
            MoviesRepositoryImpl(
              ApiClient(
                Dio(
                  BaseOptions(
                      contentType: "application/json",
                      baseUrl:
                          '${AppConstants.baseUrl}${AppConstants.apiKey}${AppConstants.apiInfo}1'),
                ),
              ),
            ),
          ),
        ),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],
      child: Builder(builder: (context) {
        final moviesBloc = BlocProvider.of<MoviesBloc>(context);
        moviesBloc.add(LoadMoviesEvent());
        return MaterialApp(
          title: 'Moview',
          theme: ThemeData.dark(),
          initialRoute: HomePage.title,
          routes: {
            HomePage.title: (context) => const HomePage(),
            MovieDetailPage.title: (context) => const MovieDetailPage(),
            FavoritesPage.title : (context) => const FavoritesPage(),
          },
        );
      }),
    );
  }
}