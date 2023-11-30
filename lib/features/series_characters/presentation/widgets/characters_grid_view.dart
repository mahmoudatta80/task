import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/series_characters/presentation/manager/cubit/fetch_character_cubit/fetch_character_cubit.dart';
import 'package:task/features/series_characters/presentation/manager/cubit/fetch_character_cubit/fetch_character_states.dart';
import 'package:task/features/series_characters/presentation/widgets/characters_grid_view_item.dart';

class CharactersGridView extends StatelessWidget {
  const CharactersGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: BlocBuilder<FetchCharactersCubit, FetchCharactersStates>(
          builder: (context, state) {
            if(state is FetchCharactersSuccessState) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CharactersGridViewItem(
                    characterModel: state.characters[index],
                  );
                },
                itemCount: state.characters.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              );
            }else if(state is FetchCharactersFailureState) {
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
            }else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black54),
              );
            }
          },
        ),
      ),
    );
  }
}
