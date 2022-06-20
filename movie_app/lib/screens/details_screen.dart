import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _overView(),
              _overView(),
              _overView(),
              CastinCards()
            ]),
          )
        ],
      ),
    );
  }
}


class _CustomAppbar extends StatelessWidget {
  
  

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
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: Text('Movie.Title',style: TextStyle(fontSize: 16),),

        ),
      background: const FadeInImage(
        placeholder:AssetImage('assets/loading.gif') ,
        image: NetworkImage('https://via.placeholder.com/500x300'),
        fit: BoxFit.cover,
      ),
      ),

    );
  }
}


class _PosterAndTitle extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const  EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
          ),
        ),

        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
            Text('original.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
            Row(children: [
              const Icon(Icons.star_outline, size:15,color:Colors.grey),
              const SizedBox(
                width: 5,
              ),
              Text('move.voteAverage',style: textTheme.caption),
            ],)          
          ],
        )
      ]),
    );
  }
}

class _overView extends StatelessWidget {
  const _overView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text('Commodo ad minim deserunt amet duis ipsum dolor. Laboris mollit duis culpa nisi ex enim aliqua dolore cupidatat enim voluptate. Aute incididunt adipisicing Lorem dolor consectetur tempor in elit velit sint do. Tempor officia consequat consectetur pariatur pariatur incididunt nisi anim. Anim in velit labore aliqua non fugiat do tempor quis laborum nostrud nostrud.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1,
    )
  );
  }
}