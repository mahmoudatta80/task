import 'package:flutter/material.dart';

class SeriesProfileImage extends StatelessWidget {
  const SeriesProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.28,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        'assets/images/ram.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
