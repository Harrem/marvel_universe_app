import 'dart:convert';

import 'characters.dart';
import 'creators.dart';
import 'date.dart';
import 'events.dart';
import 'price.dart';
import 'series.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'url.dart';
import 'variant.dart';

class Result {
  int? id;
  int? digitalId;
  String? title;
  double? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<dynamic>? textObjects;
  String? resourceUri;
  List<Url>? urls;
  Series? series;
  List<Variant>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;
  List<dynamic>? images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Events? events;

  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        id: data['id'] as int?,
        digitalId: data['digitalId'] as int?,
        title: data['title'] as String?,
        issueNumber: double.parse(data['issueNumber'].toString()),
        variantDescription: data['variantDescription'] as String?,
        description: data['description'] as String?,
        modified: data['modified'] as String?,
        isbn: data['isbn'] as String?,
        upc: data['upc'] as String?,
        diamondCode: data['diamondCode'] as String?,
        ean: data['ean'] as String?,
        issn: data['issn'] as String?,
        format: data['format'] as String?,
        pageCount: data['pageCount'] as int?,
        textObjects: data['textObjects'] as List<dynamic>?,
        resourceUri: data['resourceURI'] as String?,
        urls: (data['urls'] as List<dynamic>?)
            ?.map((e) => Url.fromMap(e as Map<String, dynamic>))
            .toList(),
        series: data['series'] == null
            ? null
            : Series.fromMap(data['series'] as Map<String, dynamic>),
        variants: (data['variants'] as List<dynamic>?)
            ?.map((e) => Variant.fromMap(e as Map<String, dynamic>))
            .toList(),
        collections: data['collections'] as List<dynamic>?,
        collectedIssues: data['collectedIssues'] as List<dynamic>?,
        dates: (data['dates'] as List<dynamic>?)
            ?.map((e) => Date.fromMap(e as Map<String, dynamic>))
            .toList(),
        prices: (data['prices'] as List<dynamic>?)
            ?.map((e) => Price.fromMap(e as Map<String, dynamic>))
            .toList(),
        thumbnail: data['thumbnail'] == null
            ? null
            : Thumbnail.fromMap(data['thumbnail'] as Map<String, dynamic>),
        images: data['images'] as List<dynamic>?,
        creators: data['creators'] == null
            ? null
            : Creators.fromMap(data['creators'] as Map<String, dynamic>),
        characters: data['characters'] == null
            ? null
            : Characters.fromMap(data['characters'] as Map<String, dynamic>),
        stories: data['stories'] == null
            ? null
            : Stories.fromMap(data['stories'] as Map<String, dynamic>),
        events: data['events'] == null
            ? null
            : Events.fromMap(data['events'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'digitalId': digitalId,
        'title': title,
        'issueNumber': issueNumber,
        'variantDescription': variantDescription,
        'description': description,
        'modified': modified,
        'isbn': isbn,
        'upc': upc,
        'diamondCode': diamondCode,
        'ean': ean,
        'issn': issn,
        'format': format,
        'pageCount': pageCount,
        'textObjects': textObjects,
        'resourceURI': resourceUri,
        'urls': urls?.map((e) => e.toMap()).toList(),
        'series': series?.toMap(),
        'variants': variants?.map((e) => e.toMap()).toList(),
        'collections': collections,
        'collectedIssues': collectedIssues,
        'dates': dates?.map((e) => e.toMap()).toList(),
        'prices': prices?.map((e) => e.toMap()).toList(),
        'thumbnail': thumbnail?.toMap(),
        'images': images,
        'creators': creators?.toMap(),
        'characters': characters?.toMap(),
        'stories': stories?.toMap(),
        'events': events?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());
}
