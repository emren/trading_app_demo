import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import '../utils/constants.dart';

///Service class for data
class DataService {
  /// A server url for demo data api
  final baseUrl = Constants.baseUrl;

  /// Authorization token
  final token = Constants.token;

  /// User can get data
  /// Finfree finfree.app/demo
  /// endpoint GET operation
  Future<Response> getData() async {
    var dio = Dio();
    var url = '$baseUrl';
    dio.options.headers[HttpHeaders.authorizationHeader] = '$token';
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
    ));
    dio.transformer = FlutterTransformer();
    var response = await dio.get(url);
    log(response.data.toString());
    return response;
  }
}
