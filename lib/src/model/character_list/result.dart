import 'dart:convert';

import 'package:flutter/material.dart';

import 'comics.dart';
import 'events.dart';
import 'series.dart';
import 'stories.dart';
import 'thumbnail.dart';
import 'url.dart';

class Result {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Comics? comics;
  Series? series;
  Stories? stories;
  Events? events;
  List<Url>? urls;

  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  @override
  String toString() {
    return 'Result(id: $id, name: $name, description: $description, modified: $modified, thumbnail: $thumbnail, resourceUri: $resourceUri, comics: $comics, series: $series, stories: $stories, events: $events, urls: $urls)';
  }

  factory Result.fromMap(Map<String, dynamic> data) {
    debugPrint("this is from Results \n --------------- \n ${data.toString()}");
    return Result(
      id: data['id'] as int?,
      name: data['name'] as String?,
      description: data['description'] as String?,
      modified: data['modified'] as String?,
      thumbnail: data['thumbnail'] == null
          ? null
          : Thumbnail.fromMap(data['thumbnail'] as Map<String, dynamic>),
      resourceUri: data['resourceURI'] as String?,
      comics: data['comics'] == null
          ? null
          : Comics.fromMap(data['comics'] as Map<String, dynamic>),
      series: data['series'] == null
          ? null
          : Series.fromMap(data['series'] as Map<String, dynamic>),
      stories: data['stories'] == null
          ? null
          : Stories.fromMap(data['stories'] as Map<String, dynamic>),
      events: data['events'] == null
          ? null
          : Events.fromMap(data['events'] as Map<String, dynamic>),
      urls: (data['urls'] as List<dynamic>?)
          ?.map((e) => Url.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'thumbnail': thumbnail?.toMap(),
        'resourceURI': resourceUri,
        'comics': comics?.toMap(),
        'series': series?.toMap(),
        'stories': stories?.toMap(),
        'events': events?.toMap(),
        'urls': urls?.map((e) => e.toMap()).toList(),
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
