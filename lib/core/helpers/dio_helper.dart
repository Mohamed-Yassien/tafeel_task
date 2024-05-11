import 'package:dio/dio.dart';

class DioHelper {
  static Dio mydio = Dio();

  static void init() {
    mydio = Dio(
      BaseOptions(
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        baseUrl: 'https://reqres.in/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 60000,
        receiveTimeout: 60000,
        sendTimeout: 60000,
      ),
    )..interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
  }

  static Future<dynamic> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    mydio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await mydio.get(
      url,
      queryParameters: query,
    );

    return response.data;
  }
}
