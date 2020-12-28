import 'package:flutter/material.dart';
import 'package:flutter_course/courses/05/src/actions/index.dart';
import 'package:flutter_course/courses/05/src/containers/index.dart';
import 'package:flutter_course/courses/05/src/models/index.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      builder: (BuildContext context, List<Movie> movies) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Course'),
            actions: <Widget>[
              OrderByContainer(
                builder: (BuildContext context, String orderBy) {
                  return IconButton(
                    icon: Icon(orderBy == 'desc' ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                    onPressed: () {
                      StoreProvider.of<AppState>(context) //
                        ..dispatch(UpdateOrderBy(orderBy == 'desc' ? 'asc' : 'desc'))
                        ..dispatch(const GetMovies());
                    },
                  );
                },
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              DropdownButton<String>(
                value: StoreProvider.of<AppState>(context).state.quality,
                items: <String>['720p', '1080p', '2160p', '3D'].map((String quality) {
                  return DropdownMenuItem<String>(
                    value: quality,
                    child: Text(quality),
                  );
                }).toList(),
                onChanged: (String value) {
                  StoreProvider.of<AppState>(context) //
                    ..dispatch(UpdateQuality(value))
                    ..dispatch(const GetMovies());
                },
              ),
              GenreContainer(
                builder: (BuildContext context, String genre) {
                  return Wrap(
                    spacing: 8.0,
                    children: <String>[
                      'Comedy',
                      'Sci-Fi',
                      'Horror',
                      'Romance',
                      'Action',
                      'Thriller',
                      'Drama',
                      'Mystery',
                      'Crime',
                      'Animation',
                      'Adventure',
                      'Fantasy',
                      'Comedy-Romance',
                      'Action-Comedy',
                      'Superhero',
                    ].map((String value) {
                      return ChoiceChip(
                        label: Text(value),
                        selected: value == genre,
                        onSelected: (bool selected) {
                          if (selected) {
                            StoreProvider.of<AppState>(context) //
                              ..dispatch(UpdateGenre(value))
                              ..dispatch(const GetMovies());
                          }
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Movie movie = movies[index];
                    return GestureDetector(
                      onTap: () {
                        StoreProvider.of<AppState>(context).dispatch(SetSelectedMovie(movies[index].id));
                        Navigator.pushNamed(context, '/movieDetail');
                      },
                      child: GridTile(
                        child: Image.network(
                          movie.mediumCover,
                          fit: BoxFit.cover,
                        ),
                        footer: GridTileBar(
                          title: Text(movie.title),
                        ),
                      ),
                    );
                  },
                ),
              ),
              FlatButton(
                child: const Text('Load more'),
                onPressed: () {
                  StoreProvider.of<AppState>(context).dispatch(const GetMovies());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
