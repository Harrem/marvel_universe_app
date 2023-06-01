import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/response/api_response.dart';
import 'package:marvel_universe_app/src/model/comic_list/comic_list.dart';
import 'package:marvel_universe_app/src/repository/comic_repo.dart';

class ComicVM with ChangeNotifier {
  final ComicRepo _repository = ComicRepo();

  ApiResponse<ComicList> _comics = ApiResponse.loading();

  ApiResponse<ComicList> get comics => _comics;

  void _setComics(ApiResponse<ComicList> resList) {
    _comics = resList;
    notifyListeners();
  }

  Future<void> fetchComics({int? limit, int? offset}) async {
    try {
      await _repository.getComics(limit ?? 10, offset ?? 0).then((value) {
        debugPrint("now passing data to ApiResponse and mark it as completed");
        return _setComics(ApiResponse.completed(value));
      }).onError((error, stackTrace) {
        debugPrint(
            "got error while passing data to ApiResponse and mark it as error");
        _setComics(ApiResponse.error("$error"));
      });
    } catch (e) {
      rethrow;
    }
  }
}
