import 'package:flutter/material.dart';

import 'components/game_cell.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _gameStarted;
  bool _isGreen;
  List<int> _cells; // 0 - empty, 1 - green, -1 - red

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    _gameStarted = true;
    _isGreen = true;
    _resetCells();
  }

  void _resetCells() {
    setState(() => _cells = <int>[0, 0, 0, 0, 0, 0, 0, 0, 0]);
  }

  void _playerMove(int cellIndex) {
    if (_cells[cellIndex] != 0) {
      return;
    }

    setState(() {
      _cells[cellIndex] = _isGreen ? 1 : -1;
      _isGreen = !_isGreen;
    });

    _checkWin();
  }

  void _showWinner(int winner, List<int> cells) {
    setState(() => _gameStarted = false);
    _resetCells();
    for (final int index in cells) {
      setState(() => _cells[index] = winner);
    }
  }

  void _checkWin() {
    int sum = 0;

    // diagonals
    sum = <int>[0, 4, 8] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[0, 4, 8]);
      return;
    }
    sum = <int>[2, 4, 6] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[2, 4, 6]);
      return;
    }

    // rows
    sum = <int>[0, 3, 6] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[0, 3, 6]);
      return;
    }
    sum = <int>[1, 4, 7] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[1, 4, 7]);
      return;
    }
    sum = <int>[2, 5, 8] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[2, 5, 8]);
      return;
    }

    // cols
    sum = <int>[0, 1, 2] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[0, 1, 2]);
      return;
    }
    sum = <int>[3, 4, 5] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[3, 4, 5]);
      return;
    }
    sum = <int>[6, 7, 8] //
        .fold(0, (int value, int index) => value + _cells[index]);
    if (sum == 3 || sum == -3) {
      _showWinner(sum ~/ 3, <int>[6, 7, 8]);
      return;
    }

    final bool anyEmpty = _cells.any((int cell) => cell == 0);
    if (!anyEmpty) {
      _showWinner(0, <int>[]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tic-tac-toe'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                ),
                itemCount: _cells.length,
                itemBuilder: (BuildContext context, int index) {
                  return GameCell(
                    state: _cells[index],
                    onPressed: () => _playerMove(index),
                  );
                },
              ),
            ),
          ),
          if (!_gameStarted)
            RaisedButton(
              child: const Text('Play again!'),
              onPressed: _resetGame,
            ),
        ],
      ),
    );
  }
}
