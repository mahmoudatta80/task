import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/helpers/api_service.dart';
import 'package:task/core/helpers/service_locator.dart';
import 'package:task/features/series_characters/data/data_sources/local_data_source/series_character_local_data_source.dart';
import 'package:task/features/series_characters/data/data_sources/remote_data_source/series_characters_remote_data_source.dart';
import 'package:task/features/series_characters/data/repo_impl/series_characters_repo_impl.dart';
import 'package:task/features/series_characters/domain/use_cases/fetch_character_use_case.dart';
import 'package:task/features/series_characters/presentation/manager/cubit/fetch_character_cubit/fetch_character_cubit.dart';
import 'package:task/features/series_characters/presentation/views/series_characters_view.dart';

class SeriesCharactersProvider extends StatelessWidget {
  const SeriesCharactersProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCharactersCubit(
        FetchCharactersUseCase(
          SeriesCharactersRepoImpl(
            SeriesCharactersRemoteDataSource(
              getIt.get<ApiService>(),
            ),
            SeriesCharactersLocalDataSource(),
          ),
        ),
      )..fetchCharacters(),
      child: const SeriesCharactersView(),
    );
  }
}
