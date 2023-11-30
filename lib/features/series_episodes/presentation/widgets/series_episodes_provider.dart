import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/helpers/api_service.dart';
import 'package:task/core/helpers/service_locator.dart';
import 'package:task/features/series_episodes/data/data_sources/local_data_source/series_episodes_local_data_source.dart';
import 'package:task/features/series_episodes/data/data_sources/remote_data_source/series_episodes_remote_data_source.dart';
import 'package:task/features/series_episodes/data/repo_impl/series_episodes_repo_impl.dart';
import 'package:task/features/series_episodes/domain/use_case/fetch_episodes_use_case.dart';
import 'package:task/features/series_episodes/presentation/manager/cubit/fetch_episodes_cubit/fetch_episodes_cubit.dart';
import 'package:task/features/series_episodes/presentation/views/series_episodes_view.dart';

class SeriesEpisodesProvider extends StatelessWidget {
  const SeriesEpisodesProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchEpisodesCubit(
        FetchEpisodesUseCase(
          SeriesEpisodesRepoImpl(
            SeriesEpisodesRemoteDataSource(
              getIt.get<ApiService>(),
            ),
            SeriesEpisodesLocalDataSource(),
          ),
        ),
      )..fetchEpisodes(),
      child: const SeriesEpisodesView(),
    );
  }
}
