// To parse this JSON data, do
//
//     final postcodesResponse = postcodesResponseFromJson(jsonString);

import 'dart:convert';

import 'place.dart';

PostcodesResponse postcodesResponseFromJson(String str) =>
    PostcodesResponse.fromJson(json.decode(str));

String postcodesResponseToJson(PostcodesResponse data) =>
    json.encode(data.toJson());

class PostcodesResponse {
  final List<Place> results;
  final double generationtimeMs;

  PostcodesResponse({required this.results, required this.generationtimeMs});

  factory PostcodesResponse.fromJson(Map<String, dynamic> json) =>
      PostcodesResponse(
        results: json["results"] == null
            ? []
            : List<Place>.from(json["results"].map((x) => Place.fromJson(x))),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "generationtime_ms": generationtimeMs,
  };
}
