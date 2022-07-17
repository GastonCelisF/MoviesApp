import 'package:flutter/material.dart';
import 'package:movie_app/models/models.dart';
import 'package:movie_app/widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
final Movie  movie = ModalRoute.of(context)!.settings.arguments as Movie;
print(movie.title);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(movie: movie,),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie:movie,),
              _overView(movie:movie,),
              _overView(movie:movie,),
              _overView(movie:movie,),
              CastinCards(movieId: movie.id,)
            ]),
          )
        ],
      ),
    );
  }
}


class _CustomAppbar extends StatelessWidget {
  
  final Movie movie;

  const _CustomAppbar({ required this.movie});

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10,left: 20,right: 20),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),

        ),
      background:  FadeInImage(
        placeholder:AssetImage('assets/loading.gif') ,
        image: NetworkImage(movie.fullBackdropPath),
        fit: BoxFit.cover,
      ),
      ),

    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  
final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag:movie.heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 110,
              //width: 80,
            ),
          ),
        ),

        const SizedBox(
          width: 20,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width - 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,), 
              Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis,maxLines: 3, ),
              Row(children: [
                const Icon(Icons.star_outline, size:15,color:Colors.grey),
                const SizedBox(
                  width: 5,
                ),
                Text('${movie.voteAverage}',style: textTheme.caption),
              ],)          
            ],
          ),
        )
      ]),
    );
  }
}

class _overView extends StatelessWidget {

  final Movie movie;

  const _overView({ required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text( movie.overview, 
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
    )
  );
  }
}