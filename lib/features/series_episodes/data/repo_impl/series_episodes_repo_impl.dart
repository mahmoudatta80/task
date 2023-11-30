import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/errors/server_failure.dart';
import 'package:task/features/series_episodes/data/data_sources/local_data_source/series_episodes_local_data_source.dart';
import 'package:task/features/series_episodes/data/data_sources/remote_data_source/series_episodes_remote_data_source.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';
import 'package:task/features/series_episodes/domain/repo/series_episodes_repo.dart';

class SeriesEpisodesRepoImpl extends SeriesEpisodesRepo {
  final SeriesEpisodesRemoteDataSource seriesEpisodesRemoteDataSource;
  final SeriesEpisodesLocalDataSource seriesEpisodesLocalDataSource;

  SeriesEpisodesRepoImpl(
    this.seriesEpisodesRemoteDataSource,
    this.seriesEpisodesLocalDataSource,
  );

  @override
  Future<Either<Failure, List<EpisodeModel>>> fetchEpisodes() async {
    try {
      List<EpisodeModel> episodes;
      episodes = seriesEpisodesLocalDataSource.fetchEpisodes();
      if(episodes.isNotEmpty) {
        return Right(episodes);
      }
      episodes = await seriesEpisodesRemoteDataSource.fetchEpisodes();
      return Right(episodes);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(
            error,
          ),
        );
      }
      return Left(
        ServerFailure(error.toString()),
      );
    }
  }
}
