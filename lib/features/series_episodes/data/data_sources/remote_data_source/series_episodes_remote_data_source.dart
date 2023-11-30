import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/helpers/api_service.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';

class SeriesEpisodesRemoteDataSource {
  final ApiService apiService;

  SeriesEpisodesRemoteDataSource(this.apiService);

  Future<List<EpisodeModel>> fetchEpisodes() async{
    Map<String, dynamic> response = await apiService.get(endPoint: 'episode');
    List<EpisodeModel> episodes = [];
    for(var episode in response['results']) {
      episodes.add(EpisodeModel.fromJson(episode));
    }
    var box = Hive.box<EpisodeModel>('episodesBox');
    box.addAll(episodes);
    return episodes;
  }
}