import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';
import 'package:task/features/series_characters/domain/repo/series_characters_repo.dart';

class FetchCharactersUseCase {
  final SeriesCharactersRepo seriesCharactersRepo;

  FetchCharactersUseCase(this.seriesCharactersRepo);

  Future<Either<Failure, List<CharacterModel>>> call() async{
    return await seriesCharactersRepo.fetchCharacters();
  }
}