import 'dart:io';

import 'package:marvel_universe_app/src/data/network/base_api_service.dart';
import 'package:dio/dio.dart';

import '../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  final _client = Dio();

  @override
  Future<Response> getResponse(String url) async {
    Response responseJson;
    try {
      final response = await _client.getUri(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.statusCode;
        return responseJson;
      case 400:
        throw BadRequestException(response.statusMessage);
      case 401:
      case 403:
        throw UnauthorisedException(response.statusMessage);
      case 404:
        throw UnauthorisedException(response.statusMessage);
      case 409:
        throw BadRequestException(response.statusMessage);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
