import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 60);

    if (dio == null) {
      dio = Dio();

      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      dio!.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Accept-Language': 'en',
      };

      addDioInterceptor();
    }

    return dio!;
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    dio?.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) {
        print("Error occurred: ${e.response?.statusCode}");

        handler.next(e);
      },
    ));
  }

  static Future<void> updateDioHeaders() async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': 'en',
    };
  }
}
