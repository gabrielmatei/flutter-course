import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieRatingFilter extends StatelessWidget {
  const MovieRatingFilter({
    @required this.selectedOption,
    @required this.onChanged,
  });

  final double selectedOption;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Minimum rating',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        RatingBar.builder(
          initialRating: selectedOption,
          minRating: 0,
          itemCount: 5,
          allowHalfRating: true,
          itemBuilder: (BuildContext context, _) {
            return const Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
          onRatingUpdate: onChanged,
        ),
      ],
    );
  }
}
