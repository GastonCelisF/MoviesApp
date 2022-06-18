import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          CardSwiper(),

          //Slider de Peliculas
          MovieSlider(),
        ],
      ),
      )
    );
  }
}