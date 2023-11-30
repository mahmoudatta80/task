import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/series_episodes/presentation/manager/cubit/fetch_episodes_cubit/fetch_episodes_cubit.dart';
import 'package:task/features/series_episodes/presentation/manager/cubit/fetch_episodes_cubit/fetch_episodes_states.dart';
import 'package:task/features/series_episodes/presentation/widgets/episodes_list_view_item.dart';

class EpisodesListView extends StatelessWidget {
  const EpisodesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FetchEpisodesCubit, FetchEpisodesStates>(
        builder: (context, state) {
          if (state is FetchEpisodesSuccessState) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return EpisodesListViewItem(
                  episodeModel: state.episodes[index],
                );
              },
              itemCount: 20,
            );
          } else if (state is FetchEpisodesFailureState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black54),
            );
          }
        },
      ),
    );
  }
}
