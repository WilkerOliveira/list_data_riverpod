import 'package:dio/dio.dart';

abstract class ClientConnection {
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters});
  Future<Response> post(String path, {Map<String, dynamic>? data});
  Future<Response> put(String path, {Map<String, dynamic>? data});
  Future<Response> delete(String path, {Map<String, dynamic>? data});
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
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String path, {Map<String, dynamic>? data}) {
    return dio.post(path, data: data);
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? data}) {
    return dio.put(path, data: data);
  }

  @override
  Future<Response> delete(String path, {Map<String, dynamic>? data}) {
    return dio.delete(path, data: data);
  }
}
