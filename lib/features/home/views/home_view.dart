import 'package:flutter/material.dart';
import 'package:task/core/themes/colors.dart';
import 'package:task/features/home/widgets/home_view_app_bar.dart';
import 'package:task/features/home/widgets/series_description.dart';
import 'package:task/features/series_episodes/presentation/widgets/series_profile_image.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColors.backGroundColor,
        ),
        child: const SafeArea(
          child: Column(
            children: [
              HomeViewAppBar(),
              SeriesProfileImage(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Rick and Morty',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SeriesDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
