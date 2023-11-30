import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';
import 'package:task/features/series_episodes/domain/repo/series_episodes_repo.dart';

class FetchEpisodesUseCase {
  final SeriesEpisodesRepo seriesEpisodesRepo;

  FetchEpisodesUseCase(this.seriesEpisodesRepo);

  Future<Either<Failure, List<EpisodeModel>>> call() async{
    return await seriesEpisodesRepo.fetchEpisodes();
  }
}