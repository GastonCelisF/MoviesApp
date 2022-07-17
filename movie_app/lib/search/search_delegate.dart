import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movies_provider.dart';



class MovieSearchDelegate extends SearchDelegate{

  

  @override
  String? get searchFieldLabel => 'Buscar Pelicula..';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed:()=> query='',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){

        close(context, null);
      },
       icon: Icon(Icons.arrow_back)
       );
  }

  @override
  Widget buildResults(BuildContext context) {
   return Text('buildResults');
  }

Widget _emptyContainer(){
  return  Container(
        child: Center(
          child:Icon(Icons.movie_creation_outlined,color:Colors.black38,size:130,),
        ),
      );
}
  
  @override
  Widget buildSuggestions(BuildContext context) {

    if(query.isEmpty){
      return _emptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen:false);
    
    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        
        if(!snapshot.hasData) return _emptyContainer();

        final movies = snapshot.data!;

        return  ListView.builder(
          itemBuilder: (_,int index) => _MovieItem(movie: movies[index],),
          itemCount: movies.length,
        );
      },
    );
  }

}


class _MovieItem extends StatelessWidget {


  final Movie movie;
  const _MovieItem({ required this.movie});

  @override
  Widget build(BuildContext context) {
  movie.heroId = 'search-${movie.id}'; 
    return ListTile(
      leading: Hero(
        tag:movie.heroId!,
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit:BoxFit.contain,
        ),
      ),
      title:Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (){
        Navigator.pushNamed(context, 'details',arguments: movie);
      },
    );
  }
}


