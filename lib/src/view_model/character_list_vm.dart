import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/response/api_response.dart';
import 'package:marvel_universe_app/src/model/character_list/character_list.dart';
import 'package:marvel_universe_app/src/repository/character_repo.dart';

class CharacterListVM with ChangeNotifier {
  final CharacterRepo _repository = CharacterRepo();

  ApiResponse<CharacterList> _characters = ApiResponse.loading();

  ApiResponse<CharacterList> get characters => _characters;

  void _setCharacters(ApiResponse<CharacterList> resList) {
    _characters = resList;
    notifyListeners();
  }

  void setLoading() {
    _characters = ApiResponse.loading();
    notifyListeners();
  }

  Future<void> loadCharacters({int? limit, int? offset}) async {
    try {
      await _repository.getCharacters(limit ?? 10, offset ?? 10).then((value) {
        debugPrint("now passing data to ApiResponse and mark it as completed");
        return _setCharacters(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        debugPrint(
            "got error while passing data to ApiResponse and mark it as error");
        _setCharacters(ApiResponse.error("$error"));
      });
    } catch (e) {
      rethrow;
    }
  }
}
