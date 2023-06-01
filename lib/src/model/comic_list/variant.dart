import 'dart:convert';

class Variant {
  String? resourceUri;
  String? name;

  Variant({this.resourceUri, this.name});

  factory Variant.fromMap(Map<String, dynamic> data) => Variant(
        resourceUri: data['resourceURI'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'resourceURI': resourceUri,
        'name': name,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Variant].
  factory Variant.fromJson(String data) {
    return Variant.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Variant] to a JSON string.
  String toJson() => json.encode(toMap());
}
