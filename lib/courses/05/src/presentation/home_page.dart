import 'package:flutter/material.dart';
import 'package:flutter_course/courses/05/src/containers/movies_container.dart';
import 'package:flutter_course/courses/05/src/models/movie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      builder: (BuildContext context, List<Movie> movies) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Course'),
          ),
          body: Column(
            children: <Widget>[
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
                    return GridTile(
                      child: Image.network(
                        movie.mediumCover,
                        fit: BoxFit.cover,
                      ),
                      footer: GridTileBar(
                        title: Text(movie.title),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
