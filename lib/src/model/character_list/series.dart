import 'dart:convert';

import 'item.dart';

class Series {
  int? available;
  String? collectionUri;
  List<Item>? items;
  int? returned;

  Series({this.available, this.collectionUri, this.items, this.returned});

  @override
  String toString() {
    return 'Series(available: $available, collectionUri: $collectionUri, items: $items, returned: $returned)';
  }

  factory Series.fromMap(Map<String, dynamic> data) => Series(
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
  /// Parses the string and returns the resulting Json object as [Series].
  factory Series.fromJson(String data) {
    return Series.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Series] to a JSON string.
  String toJson() => json.encode(toMap());
}
