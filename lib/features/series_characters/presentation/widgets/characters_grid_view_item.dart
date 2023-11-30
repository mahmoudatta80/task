import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/core/helpers/extension.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/features/series_characters/data/models/character_model.dart';

class CharactersGridViewItem extends StatelessWidget {
  final CharacterModel characterModel;

  const CharactersGridViewItem({
    Key? key,
    required this.characterModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.characterDetails, arguments: characterModel);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: CachedNetworkImage(
          imageUrl: characterModel.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
