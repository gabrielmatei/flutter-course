import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MovieGenreFilter extends StatelessWidget {
  const MovieGenreFilter({
    @required this.options,
    @required this.selectedOption,
    @required this.onChanged,
  });

  final List<String> options;
  final String selectedOption;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Genre',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile<String>(
              title: Text(options[index]),
              value: options[index],
              groupValue: selectedOption,
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}
