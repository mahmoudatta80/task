import 'package:flutter/material.dart';
import 'package:task/core/helpers/register_and_open_boxes.dart';
import 'package:task/core/routes/app_router.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/core/helpers/service_locator.dart';
import 'package:task/core/helpers/shared_preferences.dart';
import 'package:task/core/utils/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await MySharedPreferences.init();
  await Hive.initFlutter();
  await registerAndOpenHiveBoxes();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Constant.isFirstToOpenApp ? Routes.start : Routes.home,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
