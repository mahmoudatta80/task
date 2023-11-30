import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/errors/failure.dart';
import 'package:task/features/series_episodes/data/models/episode_model.dart';
import 'package:task/features/series_episodes/domain/use_case/fetch_episodes_use_case.dart';
import 'package:task/features/series_episodes/presentation/manager/cubit/fetch_episodes_cubit/fetch_episodes_states.dart';

class FetchEpisodesCubit extends Cubit<FetchEpisodesStates> {
  final FetchEpisodesUseCase fetchEpisodesUseCase;

  FetchEpisodesCubit(this.fetchEpisodesUseCase)
      : super(FetchEpisodesInitialState());

  Future fetchEpisodes() async {
    emit(FetchEpisodesLoadingState());

    Either<Failure, List<EpisodeModel>> result =
        await fetchEpisodesUseCase.call();

    if (isClosed) {
      return;
    }

    result.fold(
      (failure) => emit(FetchEpisodesFailureState(failure.message)),
      (episodes) => emit(FetchEpisodesSuccessState(episodes)),
    );
  }
}
