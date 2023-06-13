import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/network/api_endpoints.dart';
import 'package:marvel_universe_app/src/data/remote/network/base_api_service.dart';
import 'package:marvel_universe_app/src/data/remote/network/network_api_service.dart';

import '../model/character_list/character_list.dart';

class CharacterRepo {
  final BaseApiService _apiService = NetworkApiService();
  final ApiEndpoints _apiEndpoints = ApiEndpoints();

  Future<CharacterList> getCharacters(int limit, int offset) async {
    try {
      final response = await _apiService.getResponse(
              _apiService.baseUrl + _apiEndpoints.getCharacters(limit, offset))
          as Response<dynamic>;
      // debugPrint("response is of type ${response.data}");
      return CharacterList.fromMap(
          response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      debugPrint("Got error in Repo $e");
      rethrow;
    }
  }

  /// get character by id from api
  Future<CharacterList> getCharacterById(int id) async {
    try {
      final response = await _apiService
          .getResponse(_apiEndpoints.getCharacterById(id)) as Response<dynamic>;
      // debugPrint("response is of type ${response.data}");
      return CharacterList.fromMap(
          response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      debugPrint("Got error in Repo while fetching Character $e");
      rethrow;
    }
  }
}
