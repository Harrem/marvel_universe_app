import 'dart:convert';

class Item {
  String? resourceUri;
  String? name;

  Item({this.resourceUri, this.name});

  @override
  String toString() => 'Item(resourceUri: $resourceUri, name: $name)';

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        resourceUri: data['resourceURI'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'resourceURI': resourceUri,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
