import 'package:flutter/material.dart';
import 'package:task/core/helpers/extension.dart';
import 'package:task/core/helpers/shared_preferences.dart';
import 'package:task/core/routes/routes.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/start_2.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          child: ElevatedButton(
            onPressed: () {
              MySharedPreferences.setBool('isFirstToOpenApp', false)
                  .then((value) {
                context.pushReplacementNamed(
                  Routes.home,
                );
              });
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width * 0.4,
                  60,
                ),
              ),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
              backgroundColor: MaterialStateProperty.all(
                Colors.red,
              ),
            ),
            child: const Text(
              'Join Us',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
