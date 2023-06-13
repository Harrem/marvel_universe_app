import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/network/api_endpoints.dart';
import 'package:marvel_universe_app/src/data/remote/network/base_api_service.dart';
import 'package:marvel_universe_app/src/data/remote/network/network_api_service.dart';

import '../model/comic_list/comic_list.dart';

class ComicRepo {
  final BaseApiService _apiService = NetworkApiService();
  final ApiEndpoints _apiEndpoints = ApiEndpoints();

  /// get comics from api
  Future<ComicList> getComics(int limit, offset) async {
    try {
      final url = _apiService.baseUrl + _apiEndpoints.getComics(limit, offset);

      debugPrint("url is $url");
      final response = await _apiService.getResponse(url) as Response<dynamic>;
      debugPrint("response is of type ${response.data}");
      return ComicList.fromMap(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      debugPrint("Got error in Repo while fetching Comics $e");
      rethrow;
    }
  }

  /// get comics from api
  Future<ComicList> getComicById(int id) async {
    try {
      final url = _apiService.baseUrl + _apiEndpoints.getComicById(id);
      debugPrint("url is $url");
      final response = await _apiService.getResponse(url) as Response<dynamic>;
      // debugPrint("response is of type ${response.data}");
      return ComicList.fromMap(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      debugPrint("Got error in Repo while fetching Comics $e");
      rethrow;
    }
  }
}
