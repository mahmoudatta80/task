import 'package:task/features/series_characters/data/models/character_model.dart';

abstract class FetchCharactersStates {}

class FetchCharactersInitialState extends FetchCharactersStates {}
class FetchCharactersLoadingState extends FetchCharactersStates {}
class FetchCharactersSuccessState extends FetchCharactersStates {
  final List<CharacterModel> characters;

  FetchCharactersSuccessState(this.characters);
}
class FetchCharactersFailureState extends FetchCharactersStates {
  final String errorMessage;

  FetchCharactersFailureState(this.errorMessage);
}