import 'dart:convert';

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  @override
  String toString() => 'Thumbnail(path: $path, extension: $extension)';

  factory Thumbnail.fromMap(Map<String, dynamic> data) => Thumbnail(
        path: data['path'] as String?,
        extension: data['extension'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'path': path,
        'extension': extension,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Thumbnail].
  factory Thumbnail.fromJson(String data) {
    return Thumbnail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Thumbnail] to a JSON string.
  String toJson() => json.encode(toMap());
}
