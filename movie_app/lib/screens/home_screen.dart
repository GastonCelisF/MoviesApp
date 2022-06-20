import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

final moviesProvider = Provider.of<MoviesProvier>(context, listen:true);


    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en Cines'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){},
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
            movies: moviesProvider.popularMovies,
            title: 'Populares',
          ),
        ],
      ),
      )
    );
  }
}