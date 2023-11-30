import 'package:flutter/material.dart';
import 'package:task/core/helpers/extension.dart';

class SeriesEpisodesAppBar extends StatelessWidget {
  const SeriesEpisodesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
              color: Colors.black45,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              size: 30,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}
