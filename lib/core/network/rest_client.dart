import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'dart:io';

enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "https://jsonplaceholder.typicode.com/posts";

class RestClient extends GetxService {
  late d.Dio _dio;

  static header() => {
        'Content-Type': 'application/json',
      };

  Future<RestClient> init() async {
    _dio = d.Dio(d.BaseOptions(baseUrl: BASE_URL, headers: header()));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio.interceptors.add(d.InterceptorsWrapper(onRequest: (options, handler) {
      // print('REQUEST[${options.method}] => PATH: ${options.path} '
      //     '=> Request Values: ${options.queryParameters}, => HEADERS: ${options.headers}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      // print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (err, handler) {
      print('ERROR[${err.response?.statusCode}]');
      return handler.next(err);
    }));
  }

  Future<dynamic> request(
      String url, Method method, Map<String, dynamic>? params) async {
    d.Response response;

    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch (e) {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on d.DioError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }
}
