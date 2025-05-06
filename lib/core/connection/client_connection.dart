import 'package:dio/dio.dart';
import 'package:list_data_riverpod/core/connection/http_response.dart';

abstract class ClientConnection {
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
  Future<HttpResponse> post(String path, {Map<String, dynamic>? data});
  Future<HttpResponse> put(String path, {Map<String, dynamic>? data});
  Future<HttpResponse> delete(String path, {Map<String, dynamic>? data});
}

class ClientConnectionImpl implements ClientConnection {
  late Dio dio;

  ClientConnectionImpl() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://private-e99c19-properties11.apiary-mock.com/',
        connectTimeout: Duration(seconds: 60),
        receiveTimeout: Duration(seconds: 60),
        sendTimeout: Duration(seconds: 60),
      ),
    );
  }

  @override
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final result = await dio.get(path, queryParameters: queryParameters);
    return HttpResponse(data: result.data, statusCode: result.statusCode);
  }

  @override
  Future<HttpResponse> post(String path, {Map<String, dynamic>? data}) async {
    final result = await dio.post(path, data: data);
    return HttpResponse(data: result.data, statusCode: result.statusCode);
  }

  @override
  Future<HttpResponse> put(String path, {Map<String, dynamic>? data}) async {
    final result = await dio.put(path, data: data);
    return HttpResponse(data: result.data, statusCode: result.statusCode);
  }

  @override
  Future<HttpResponse> delete(String path, {Map<String, dynamic>? data}) async {
    final result = await dio.delete(path, data: data);
    return HttpResponse(data: result.data, statusCode: result.statusCode);
  }
}
