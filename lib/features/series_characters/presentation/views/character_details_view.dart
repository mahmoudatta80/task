import 'package:flutter/material.dart';
import 'package:task/core/themes/colors.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';
import 'package:task/features/series_characters/presentation/widgets/character_details_image.dart';
import 'package:task/features/series_characters/presentation/widgets/character_details_view_app_bar.dart';

class CharacterDetailsView extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterDetailsView({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColors.backGroundColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const CharacterDetailsViewAppBar(),
                CharacterDetailsImage(
                  image: characterModel.image,
                ),
                const SizedBox(height: 40),
                Text(
                  'name : ${characterModel.name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'status : ${characterModel.status}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'species : ${characterModel.species}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'gender : ${characterModel.gender}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
