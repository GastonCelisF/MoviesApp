import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  
  final List<Movie> movie;
  final String? title;
  

  const MovieSlider({super.key, required this.movie,  this.title});
  @override
  Widget build(BuildContext context) {
    var widget;
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(  this.title != null)
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(  this.title!, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            const SizedBox(
              height: 1,
            ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.length,
              itemBuilder: (_,int index)=> _MoviePoster( movie[index], '${title}-${index}-${movie[index].id}')
              ),
          )
        ],
      ),
    );
  }
}
class _MoviePoster extends StatelessWidget {
  
  final Movie movie;
  final String  heroId;

  const _MoviePoster( this.movie, this.heroId);



  @override
  Widget build(BuildContext context) {


    movie.heroId= heroId;

    return Container(
                  width: 130,
                  height: 190,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child:Column(children: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
                      child: Hero(
                        tag:movie.heroId!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'),
                             image: NetworkImage( movie.fullPosterImg),
                             width: 130,
                             height: 190,
                             fit: BoxFit.cover,
                             ),
                        ),
                      ),
                    ),

                       SizedBox(height: 5,),
                        Text( movie.title,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.center,
                       ),
                       
                  ],
                  ),
                );
  }
}