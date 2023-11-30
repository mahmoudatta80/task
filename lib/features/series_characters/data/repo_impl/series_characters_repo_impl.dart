import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/core/errors/server_failure.dart';
import 'package:task/features/series_characters/data/data_sources/local_data_source/series_character_local_data_source.dart';
import 'package:task/features/series_characters/data/data_sources/remote_data_source/series_characters_remote_data_source.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';
import 'package:task/features/series_characters/domain/repo/series_characters_repo.dart';

class SeriesCharactersRepoImpl extends SeriesCharactersRepo {
  final SeriesCharactersRemoteDataSource seriesCharactersRemoteDataSource;
  final SeriesCharactersLocalDataSource seriesCharactersLocalDataSource;

  SeriesCharactersRepoImpl(
    this.seriesCharactersRemoteDataSource,
    this.seriesCharactersLocalDataSource,
  );

  @override
  Future<Either<Failure, List<CharacterModel>>> fetchCharacters() async {
    try {
      List<CharacterModel> characters;
      characters = seriesCharactersLocalDataSource.fetchCharacters();
      if(characters.isNotEmpty) {
        return Right(characters);
      }
      characters = await seriesCharactersRemoteDataSource.fetchCharacters();
      return Right(characters);
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
