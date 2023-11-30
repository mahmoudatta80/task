import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';

class SeriesEpisodesLocalDataSource {
  List<EpisodeModel> fetchEpisodes() {
    var episodesBox = Hive.box<EpisodeModel>('episodesBox');
    return episodesBox.values.toList();
  }
}