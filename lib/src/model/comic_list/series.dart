import 'dart:convert';

class Series {
  String? resourceUri;
  String? name;

  Series({this.resourceUri, this.name});

  factory Series.fromMap(Map<String, dynamic> data) => Series(
        resourceUri: data['resourceURI'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'resourceURI': resourceUri,
        'name': name,
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
