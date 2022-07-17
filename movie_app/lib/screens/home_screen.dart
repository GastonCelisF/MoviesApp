import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

final moviesProvider = Provider.of<MoviesProvider>(context, listen:true);


    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: ()=>showSearch(context: context, delegate: MovieSearchDelegate()),
           icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          //Tarjetas Principales 
          CardSwiper(movies: moviesProvider.onDisplayMovies),

          //Slider de Peliculas
          MovieSlider(
            movie: moviesProvider.popularMovies,
            title: 'Populares',
          ),
        ],
      ),
      )
    );
  }
}