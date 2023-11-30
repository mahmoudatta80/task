import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';

abstract class SeriesCharactersRepo {
  Future<Either<Failure, List<CharacterModel>>> fetchCharacters();
}