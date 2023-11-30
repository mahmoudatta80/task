import 'package:task/core/helpers/shared_preferences.dart';

class Constant {
  static final bool isFirstToOpenApp = MySharedPreferences.getBool('isFirstToOpenApp');
}