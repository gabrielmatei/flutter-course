import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this._movie);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        _movie.cover,
        fit: BoxFit.cover,
        errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
          return const Center(
            child: Text('Movie photo not found'),
          );
        },
      ),
      footer: GridTileBar(
        title: Text(
          _movie.title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(_movie.genres.join(', ')),
        backgroundColor: Colors.black54,
        trailing: Row(
          children: <Widget>[
            const Icon(
              Icons.star,
              size: 14.0,
              color: Colors.amber,
            ),
            Text(
              '${_movie.rating}',
              style: const TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
