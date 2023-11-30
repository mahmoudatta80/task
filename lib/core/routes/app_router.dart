import 'package:flutter/material.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/features/home/views/home_view.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';
import 'package:task/features/series_characters/presentation/views/character_details_view.dart';
import 'package:task/features/series_characters/presentation/widgets/series_characters_provider.dart';
import 'package:task/features/series_episodes/presentation/widgets/series_episodes_provider.dart';
import 'package:task/features/start/start_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.start:
        return MaterialPageRoute(
          builder: (context) => const StartView(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.seriesEpisodes:
        return MaterialPageRoute(
          builder: (context) => const SeriesEpisodesProvider(),
        );
      case Routes.seriesCharacters:
        return MaterialPageRoute(
          builder: (context) => const SeriesCharactersProvider(),
        );
      case Routes.characterDetails:
        final characterModel = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          builder: (context) => CharacterDetailsView(
            characterModel: characterModel,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text('default'),
              ),
            ),
          ),
        );
    }
  }
}
