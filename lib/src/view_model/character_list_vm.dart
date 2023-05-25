import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/response/api_response.dart';
import 'package:marvel_universe_app/src/model/character_list/character_list.dart';
import 'package:marvel_universe_app/src/repository/character_repo.dart';

class CharacterListVM extends ChangeNotifier {
  final CharacterRepo _repository = CharacterRepo();

  ApiResponse<CharacterList> _characters = ApiResponse.loading();

  ApiResponse<CharacterList> get characters => _characters;

  void _setCharacters(ApiResponse<CharacterList> resList) {
    _characters = resList;
    notifyListeners();
  }

  Future<void> loadCharacters() async {
    try {
      await _repository
          .getCharacters()
          .then((value) => _setCharacters(ApiResponse.completed(value)))
          .onError((error, stackTrace) =>
              _setCharacters(ApiResponse.error("$error")));
    } catch (e) {
      rethrow;
    }
  }
}
