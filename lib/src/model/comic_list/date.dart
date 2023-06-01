import 'dart:convert';

class Date {
  String? type;
  String? date;

  Date({this.type, this.date});

  factory Date.fromMap(Map<String, dynamic> data) => Date(
        type: data['type'] as String?,
        date: data['date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'date': date,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Date].
  factory Date.fromJson(String data) {
    return Date.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Date] to a JSON string.
  String toJson() => json.encode(toMap());
}
