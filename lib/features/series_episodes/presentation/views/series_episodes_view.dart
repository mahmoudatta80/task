import 'package:flutter/material.dart';
import 'package:task/core/themes/colors.dart';
import 'package:task/features/series_episodes/presentation/widgets/episodes_list_view.dart';
import 'package:task/features/series_episodes/presentation/widgets/series_episodes_app_bar.dart';
import 'package:task/features/series_episodes/presentation/widgets/series_profile_image.dart';

class SeriesEpisodesView extends StatelessWidget {
  const SeriesEpisodesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColors.backGroundColor,
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeriesEpisodesAppBar(),
              SeriesProfileImage(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Episodes List',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              EpisodesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
