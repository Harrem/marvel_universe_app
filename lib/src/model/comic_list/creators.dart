import 'dart:convert';

class Creators {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Creators({this.available, this.collectionUri, this.items, this.returned});

  factory Creators.fromMap(Map<String, dynamic> data) => Creators(
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
  /// Parses the string and returns the resulting Json object as [Creators].
  factory Creators.fromJson(String data) {
    return Creators.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Creators] to a JSON string.
  String toJson() => json.encode(toMap());
}
