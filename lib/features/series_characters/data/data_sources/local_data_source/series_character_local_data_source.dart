import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';

class SeriesCharactersLocalDataSource {
  List<CharacterModel> fetchCharacters() {
    var charactersBox = Hive.box<CharacterModel>('charactersBox');
    return charactersBox.values.toList();
  }
}