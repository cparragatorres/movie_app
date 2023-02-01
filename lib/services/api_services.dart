import 'dart:convert';

import 'package:app_movie/models/movie_models.dart';
import 'package:http/http.dart' as http;


class APIServices{
  Future<List<MovieModel>> getMovies() async {
    Uri _uri = Uri.parse(
      "https://api.themoviedb.org/3/discover/movie?api_key=b023410500aafb2c79fe3179a1da5f64&language=es-Es",
    );
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      // print(response.body);
      Map<String, dynamic> myMap = json.decode(response.body);
      List movies = myMap["results"];

      List<MovieModel> moviesList = movies.map((e) => MovieModel.fromJson(e)).toList();
      return moviesList;
    }
    return [];
  }
}