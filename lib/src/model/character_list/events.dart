import 'dart:convert';

import 'item.dart';

class Events {
  int? available;
  String? collectionUri;
  List<Item>? items;
  int? returned;

  Events({this.available, this.collectionUri, this.items, this.returned});

  @override
  String toString() {
    return 'Events(available: $available, collectionUri: $collectionUri, items: $items, returned: $returned)';
  }

  factory Events.fromMap(Map<String, dynamic> data) => Events(
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
  /// Parses the string and returns the resulting Json object as [Events].
  factory Events.fromJson(String data) {
    return Events.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Events] to a JSON string.
  String toJson() => json.encode(toMap());
}
