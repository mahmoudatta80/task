import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/helpers/api_service.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';

class SeriesCharactersRemoteDataSource {
  final ApiService apiService;

  SeriesCharactersRemoteDataSource(this.apiService);

  Future<List<CharacterModel>> fetchCharacters() async{
    Map<String, dynamic> response = await apiService.get(endPoint: 'character');
    List<CharacterModel> characters = [];
    for(var character in response['results']) {
      characters.add(CharacterModel.fromJson(character));
    }
    var box = Hive.box<CharacterModel>('charactersBox');
    box.addAll(characters);
    return characters;
  }
}