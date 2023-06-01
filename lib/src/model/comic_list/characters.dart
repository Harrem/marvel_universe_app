import 'dart:convert';

class Characters {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Characters.fromMap(Map<String, dynamic> data) => Characters(
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
  /// Parses the string and returns the resulting Json object as [Characters].
  factory Characters.fromJson(String data) {
    return Characters.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Characters] to a JSON string.
  String toJson() => json.encode(toMap());
}
