import 'package:task/features/series_episodes/data/models/episode_model.dart';

abstract class FetchEpisodesStates {}

class FetchEpisodesInitialState extends FetchEpisodesStates {}

class FetchEpisodesLoadingState extends FetchEpisodesStates {}

class FetchEpisodesSuccessState extends FetchEpisodesStates {
  final List<EpisodeModel> episodes;

  FetchEpisodesSuccessState(this.episodes);
}

class FetchEpisodesFailureState extends FetchEpisodesStates {
  final String errorMessage;

  FetchEpisodesFailureState(this.errorMessage);
}
