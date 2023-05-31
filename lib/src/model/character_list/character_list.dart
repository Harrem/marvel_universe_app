import 'dart:convert';

import 'package:flutter/material.dart';

import 'result.dart';

class CharacterList {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Result>? results;

  CharacterList({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  @override
  String toString() {
    return 'CharacterList(offset: $offset, limit: $limit, total: $total, count: $count, results: $results)';
  }

  factory CharacterList.fromMap(Map<String, dynamic> data) {
    // var data = initData['data'] as Map<String, dynamic>;
    return CharacterList(
      offset: data['offset'] as int?,
      limit: data['limit'] as int?,
      total: data['total'] as int?,
      count: data['count'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'offset': offset,
        'limit': limit,
        'total': total,
        'count': count,
        'results': results?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterList].
  factory CharacterList.fromJson(String data) {
    final str = json.decode(data)['result'];
    debugPrint("this is me :$str");
    return CharacterList.fromMap(
        json.decode(data)['result'] as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterList] to a JSON string.
  String toJson() => json.encode(toMap());
}
