import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:homeservice/core/error/exception.dart';
import 'exception_handlers.dart';
import 'log_interceptor.dart';

class NetworkRequester {
  final Dio _dio;
  final cancelToken = CancelToken();
  NetworkRequester() : _dio = Dio() {
    _dio.options = BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {'Accept': Headers.jsonContentType},
    );

    _dio.interceptors.clear();

    _dio.interceptors.addAll([
      LoggingInterceptor(),
    ]);
  }

  Future<dynamic> request({
    required String method,
    required String path,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    try {
      final response = await _dio.request(
        path,
        options: Options(method: method),
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      throw ExceptionHandler.handle(e);
    } catch (e) {
      throw APIException(message: "Unexpected error: $e");
    }
  }

  Future<dynamic> get(String path, {Map<String, dynamic>? query}) =>
      request(method: 'GET', path: path, query: query);

  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? query,
    dynamic data,
  }) => request(method: 'POST', path: path, query: query, data: data);

  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? query,
    dynamic data,
  }) => request(method: 'PUT', path: path, query: query, data: data);

}
