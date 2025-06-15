import 'dart:convert';

import 'package:day_3/model/movie_details_model.dart';
import 'package:day_3/model/movie_model.dart';
import 'package:http/http.dart' as http;

Future<List<MovieModel>> getPopularMovieByTag(String tag) async {
  // https://api.sampleapis.com/movies/drama

  var url = Uri.https('api.sampleapis.com', 'movies/${tag}');
  var response = await http.get(url);
  return List.from(json.decode(response.body)).map((m) {
    return MovieModel.fromJson(m);
  }).toList();
}

Future<MovieDetailsModel?> movieDetailsByImdbId(String id) async {
  var url = Uri.https('omdbapi.com', '', {"i": id, "apikey": "22bf21a"});
  var response = await http.get(url);

  return MovieDetailsModel.fromJson(json.decode(response.body));
  // print(await http.read(Uri.https('example.com', 'foobar.txt')));
}
