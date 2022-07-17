import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/models.dart';
import 'package:movie_app/models/popular_response.dart';
import 'package:movie_app/models/search_response.dart';
import 'package:movie_app/search/search_delegate.dart';

class MoviesProvider extends ChangeNotifier{

String _apiKey = '3500538649c1b00b6e89b0ac2b549cdc';
String _baseUrl = 'api.themoviedb.org';
String _language = 'es-ES';

List<Movie> onDisplayMovies = [];
List<Movie> popularMovies = [];

Map<int,List<Cast>> moviesCast = {};

int _popularPage = 0;

  MoviesProvider(){
  print('MoviesProvier inicializado');
  this.getOnDisplayMovies();
  this.getPopularMovies();
  }


Future<String> _getJsonDdata(String endpoint,[int page = 1])async {
   final url = Uri.https( _baseUrl, endpoint, {
       'api_key': _apiKey,
       'language': _language,
       'page': '$page'
       });

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  return response.body;
}

  getOnDisplayMovies() async{
    final jsonData = await this._getJsonDdata('3/movie/now_playing');

  final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
  print(nowPlayingResponse.results[1].title);

  this.onDisplayMovies = nowPlayingResponse.results;

  notifyListeners();
  }

  getPopularMovies()async {


    _popularPage++;
    final jsonData = await this._getJsonDdata('3/movie/popular',_popularPage);

  final popularResponse = PopularResponse.fromJson(jsonData);

  this.popularMovies = [...popularMovies,...popularResponse.results];
  notifyListeners();
  }

Future<List<Cast>> getMovieCast(int movieId) async{

  if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;


  final jsonData = await this._getJsonDdata('3/movie/$movieId/credits');
  final creditsResponse = CreditResponse.fromJson(jsonData);

  moviesCast[movieId] = creditsResponse.cast;
  return creditsResponse.cast;
}

 Future<List<Movie>> searchMovie(String query) async{


    final  url = Uri.https( _baseUrl, '3/search/movie', {
       'api_key': _apiKey,
       'language': _language,
       'query': query
       });

         final response = await http.get(url);
         final searchResponse = SearchResponse.fromJson(response.body);
         return searchResponse.results;
 }

}