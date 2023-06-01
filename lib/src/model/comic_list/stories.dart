import 'dart:convert';

class Stories {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Stories({this.available, this.collectionUri, this.items, this.returned});

  factory Stories.fromMap(Map<String, dynamic> data) => Stories(
        available: data['available'] as int?,
        collectionUri: data['collectionURI'] as String?,
        items: data['items'] as List<dynamic>?,
        returned: data['returned'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'available': available,
        'collectionURI': collectionUri,
        'items': items,
        'returned': returned,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Stories].
  factory Stories.fromJson(String data) {
    return Stories.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stories] to a JSON string.
  String toJson() => json.encode(toMap());
}
