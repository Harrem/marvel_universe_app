import 'dart:convert';

class Events {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Events({this.available, this.collectionUri, this.items, this.returned});

  factory Events.fromMap(Map<String, dynamic> data) => Events(
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
  /// Parses the string and returns the resulting Json object as [Events].
  factory Events.fromJson(String data) {
    return Events.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Events] to a JSON string.
  String toJson() => json.encode(toMap());
}
