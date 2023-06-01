import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/network/base_api_service.dart';
import 'package:dio/dio.dart';

import '../../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  final _client = Dio();

  @override
  Future<Response> getResponse(String url) async {
    Response responseJson;
    try {
      final uri = Uri.parse(url);
      final response = await _client.getUri(uri);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } catch (e) {
      debugPrint('an error occured $e');
      rethrow;
    }
    return responseJson;
  }

  Response returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response;
        return responseJson;
      case 400:
        debugPrint("${response.statusMessage} bad request harrem");
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
