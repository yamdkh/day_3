import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  final int id;
  final String title;
  final String posterUrl;
  final String imdbId;

  MovieModel({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.imdbId,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["title"],
    posterUrl: json["posterURL"],
    imdbId: json["imdbId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "posterURL": posterUrl,
    "imdbId": imdbId,
  };
}
