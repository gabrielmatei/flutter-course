import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MovieQualityFilter extends StatelessWidget {
  const MovieQualityFilter({
    @required this.options,
    @required this.onChanged,
  });

  final Map<String, bool> options;
  final Function(String, bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Quality',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            final String key = options.keys.elementAt(index);
            return CheckboxListTile(
              title: Text(key),
              value: options[key],
              onChanged: (bool value) => onChanged(key, value),
            );
          },
        ),
      ],
    );
  }
}
