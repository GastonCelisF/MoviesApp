import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/models.dart';

class MoviesProvier extends ChangeNotifier{

String _apiKey = '3500538649c1b00b6e89b0ac2b549cdc';
String _baseUrl = 'api.themoviedb.org';
String _language = 'es-ES';

  MoviesProvier(){
  print('MoviesProvier inicializado');
  this.getOnDisplayMovies();
  }


  getOnDisplayMovies() async{
     var url = Uri.https(this._baseUrl, '3/movie/now_playing', {
       'api_key': _apiKey,
       'language': _language,
       'page':'1'
       });

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
  print(nowPlayingResponse.results[1].title);
  }
}