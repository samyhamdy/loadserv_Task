import 'package:dio/dio.dart';
import 'package:loadserv_task/core/network/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  DioHelper._();
  static Future<Dio> getInstance() async {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      dio!.options.baseUrl = ApiEndPoints.baseUrl;
      dio!.options.headers = {
        'Accept': 'application/json',
      };
      dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    return dio!;
  }

  Future<Response?> getData({
    String? requestName,
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
    };
    return null;
  }

  Future<Response?> postData({
    String? requestName,
    required String url,
    dynamic data,
    String? lang,
    String? token,
    Map<String, dynamic>? query,
    bool withFiles = false,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
    };

    try {
      var res = await dio!.post(
        url,
        data: data,
        queryParameters: query,
      );
      return res;
    } on DioException catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      }
      rethrow;
    }
  }
}
