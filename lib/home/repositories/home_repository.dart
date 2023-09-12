import 'dart:convert';
import 'dart:io';
import 'package:movie_app/home/models/movies_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<MoviesModel> getMovies() async {
    try {
      MoviesModel? movie;
      var urlMinha =
          'https://api.themoviedb.org/4/list/1';
      await http.get(Uri.parse(urlMinha), headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${dotenv.env['APIKEY']!}'
      }).then(
        (value) {
          if (value.statusCode == 200) {
            movie = MoviesModel.fromJson(json.decode(value.body));
          }
        },
      );
      return movie ?? MoviesModel();
    } catch (e) {
      e.toString();
      throw Exception('erro $e');
    }
  }
}
