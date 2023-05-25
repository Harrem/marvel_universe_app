import 'dart:convert';

import 'item.dart';

class Stories {
  int? available;
  String? collectionUri;
  List<Item>? items;
  int? returned;

  Stories({this.available, this.collectionUri, this.items, this.returned});

  @override
  String toString() {
    return 'Stories(available: $available, collectionUri: $collectionUri, items: $items, returned: $returned)';
  }

  factory Stories.fromMap(Map<String, dynamic> data) => Stories(
        available: data['available'] as int?,
        collectionUri: data['collectionURI'] as String?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
        returned: data['returned'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'available': available,
        'collectionURI': collectionUri,
        'items': items?.map((e) => e.toMap()).toList(),
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
