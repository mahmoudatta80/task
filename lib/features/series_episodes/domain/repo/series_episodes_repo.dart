import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';

abstract class SeriesEpisodesRepo {
  Future<Either<Failure, List<EpisodeModel>>> fetchEpisodes();
}