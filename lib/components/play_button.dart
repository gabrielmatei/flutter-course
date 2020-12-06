import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          height: 160.0,
          decoration: BoxDecoration(
            // color: Colors.blue,
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              colors: <Color>[
                Colors.blue,
                Colors.blue[300],
              ],
              stops: const <double>[0.75, 1],
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
