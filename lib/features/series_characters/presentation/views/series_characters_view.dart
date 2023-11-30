import 'package:flutter/material.dart';
import 'package:task/core/themes/colors.dart';
import 'package:task/features/series_characters/presentation/widgets/characters_grid_view.dart';
import 'package:task/features/series_characters/presentation/widgets/series_characters_app_bar.dart';

class SeriesCharactersView extends StatelessWidget {
  const SeriesCharactersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColors.backGroundColor,
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SeriesCharactersAppBar(),
                CharactersGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
