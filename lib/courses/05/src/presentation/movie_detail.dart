import 'package:flutter/material.dart';
import 'package:flutter_course/courses/05/src/containers/index.dart';
import 'package:flutter_course/courses/05/src/models/index.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieContainer(
      builder: (BuildContext context, Movie movie) {
        return Scaffold(
          appBar: AppBar(
            title: Text(movie.title),
          ),
          body: Image.network(movie.largeCover),
        );
      },
    );
  }
}
