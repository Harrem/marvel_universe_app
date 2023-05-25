import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/network/base_api_service.dart';
import 'package:dio/dio.dart';

import '../../app_exceptions.dart';

class NetworkApiService extends BaseApiService {
  final _client = Dio();
  final urll =
      'https://gateway.marvel.com:443/v1/public/characters?limit=1&ts=1234&apikey=c2031f2a8740ce30bccaf09984c3f122&hash=8c872de752bc49006328642d1ae0946c';

  @override
  Future<Response> getResponse(String url) async {
    Response responseJson;
    try {
      final response = await _client.getUri(Uri.parse(urll));
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
