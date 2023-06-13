import 'package:marvel_universe_app/src/data/localdb/apikey.dart';
import 'package:marvel_universe_app/src/utils/md5.dart';

class ApiEndpoints {
  final String _getCharacters = 'characters';
  final String _getComics = 'comics';
  final String _getCreators = 'creators';
  final String _getEvents = 'events';
  final String _getSeries = 'series';
  final String _getStories = 'stories';

  /// Get characters from Marvel API
  String getCharacters(int limit, int offset) =>
      '$_getCharacters?limit=$limit&offset=$offset&${getAuthEndPoint()}';

  /// Get character by id from Marvel API
  String getCharacterById(int id) => '$_getCharacters/$id?';

  /// Get comics from Marvel API
  String getComics(int limit, int offset) =>
      "$_getComics?limit=$limit&offset=$offset&${getAuthEndPoint()}";
  String getComicById(int id) => '$_getComics/$id?${getAuthEndPoint()}';

  String get getCreators => _getCreators;
  String get getEvents => _getEvents;
  String get getSeries => _getSeries;
  String get getStories => _getStories;

  String getAuthEndPoint() {
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = MD5.encrypt(timeStamp, apiKeyPrivate, apiKeyPublic);
    return 'ts=$timeStamp&apikey=$apiKeyPublic&hash=$hash';
  }
}
