import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/network/api_endpoints.dart';
import 'package:marvel_universe_app/src/data/remote/network/base_api_service.dart';
import 'package:marvel_universe_app/src/data/remote/network/network_api_service.dart';

import '../model/character_list/character_list.dart';

class CharacterRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<CharacterList> getCharacters() async {
    try {
      final response = await _apiService
          .getResponse(ApiEndpoints().getCharacters) as Response;
      debugPrint("$response");
      return CharacterList.fromJson(response.data);
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }
}
