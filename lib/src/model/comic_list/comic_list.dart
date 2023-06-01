import 'dart:convert';

import 'result.dart';

class ComicList {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  ComicList({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory ComicList.fromMap(Map<String, dynamic> data) => ComicList(
        offset: data['offset'] as int?,
        limit: data['limit'] as int?,
        total: data['total'] as int?,
        count: data['count'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ComicList].
  factory ComicList.fromJson(String data) {
    return ComicList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ComicList] to a JSON string.
  String toJson() => json.encode(toMap());
}
