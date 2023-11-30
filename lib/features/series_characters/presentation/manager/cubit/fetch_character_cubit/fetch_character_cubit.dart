import 'package:dartz/dartz.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';
import 'package:task/features/series_characters/domain/use_cases/fetch_character_use_case.dart';
import 'package:task/features/series_characters/presentation/manager/cubit/fetch_character_cubit/fetch_character_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchCharactersCubit extends Cubit<FetchCharactersStates> {
  final FetchCharactersUseCase fetchCharactersUseCase;

  FetchCharactersCubit(this.fetchCharactersUseCase)
      : super(FetchCharactersInitialState());

  Future fetchCharacters() async {
    emit(FetchCharactersLoadingState());

    Either<Failure, List<CharacterModel>> result =
        await fetchCharactersUseCase.call();

    if (isClosed) {
      return;
    }

    result.fold(
      (failure) => emit(FetchCharactersFailureState(failure.message)),
      (characters) => emit(FetchCharactersSuccessState(characters)),
    );
  }
}
