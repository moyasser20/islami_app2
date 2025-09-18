import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../constants/api/api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  @Named("quran")
  Dio dioQuran() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  }

  @lazySingleton
  @Named("time")
  Dio dioTime() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl2,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  }
}
