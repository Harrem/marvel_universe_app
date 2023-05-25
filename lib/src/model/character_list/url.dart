import 'dart:convert';

class Url {
  String? type;
  String? url;

  Url({this.type, this.url});

  factory Url.fromMap(Map<String, dynamic> data) => Url(
        type: data['type'] as String?,
        url: data['url'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Url].
  factory Url.fromJson(String data) {
    return Url.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Url] to a JSON string.
  String toJson() => json.encode(toMap());
}
