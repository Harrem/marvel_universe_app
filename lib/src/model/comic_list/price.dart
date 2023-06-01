import 'dart:convert';

class Price {
  String? type;
  double? price;

  Price({this.type, this.price});

  factory Price.fromMap(Map<String, dynamic> data) => Price(
        type: data['type'] as String?,
        price: double.parse(data['price'].toString()),
      );

  Map<String, dynamic> toMap() => {
        'type': type,
        'price': price,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Price].
  factory Price.fromJson(String data) {
    return Price.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Price] to a JSON string.
  String toJson() => json.encode(toMap());
}
