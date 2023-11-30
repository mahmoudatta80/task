import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/core/helpers/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
}
