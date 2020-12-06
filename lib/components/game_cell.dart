import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class GameCell extends StatelessWidget {
  const GameCell({
    Key key,
    @required this.state,
    @required this.onPressed,
  }) : super(key: key);

  final int state;
  final Function onPressed;

  Color _getCellColor(int state) {
    switch (state) {
      case 1:
        return Colors.green;
      case -1:
        return Colors.red;
      default:
        return Colors.grey[400];
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _getCellColor(state),
        // color: _isEmpty ? Colors.white : widget.playerColor,
      ),
      onTap: onPressed,
    );
  }
}
