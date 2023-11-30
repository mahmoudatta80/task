import 'package:flutter/material.dart';
import 'package:task/core/helpers/extension.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/features/home/widgets/custom_button.dart';

class SeriesDescription extends StatelessWidget {
  const SeriesDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            const EdgeInsetsDirectional.only(
              top: 25,
              bottom: 15,
              start: 15,
              end: 15,
            ),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(30),
            topStart: Radius.circular(30),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Rick and Morty is an animated adult science fiction sitcom that follows the adventures of an eccentric and alcoholic scientist, Rick Sanchez, and his good-hearted but easily influenced grandson, Morty Smith. The show was created by Justin Roiland and Dan Harmon and premiered in 2013. ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    context.pushNamed(Routes.seriesCharacters);
                  },
                  text: 'Characters',
                ),
                CustomButton(
                  onPressed: () {
                    context.pushNamed(Routes.seriesEpisodes);
                  },
                  text: 'Episodes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
