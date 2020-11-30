import 'dart:math';

import 'package:flutter/material.dart';

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
  final Random _random = Random();
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool _isFinished;
  int _initialNumber;
  int _currentNumber;
  String _guessResponse;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _isFinished = false;
      _initialNumber = 1 + _random.nextInt(100);
      _guessResponse = null;
    });
  }

  bool _checkGuess() {
    bool win = false;
    String response = '';
    if (_initialNumber == _currentNumber) {
      response = 'You guessed right';
      win = true;
    } else if (_currentNumber < _initialNumber) {
      response = 'Try higher';
    } else {
      response = 'Try lower';
    }
    setState(() => _guessResponse = response);

    return win;
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();

      final bool gameWon = _checkGuess();
      if (gameWon) {
        setState(() => _isFinished = true);

        showDialog<Widget>(
          barrierDismissible: false,
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('You guessed right'),
            content: Text('It was $_initialNumber'),
            actions: <Widget>[
              FlatButton(
                child: const Text('Try again!'),
                onPressed: () {
                  _resetGame();
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess my number'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'I\'am thinking of a number between 1 and 100.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'It\'s your turn to guess my number!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              if (_guessResponse != null)
                Text(
                  'You tried $_currentNumber\n$_guessResponse',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 36.0),
                ),
              const SizedBox(height: 20.0),
              Form(
                key: _formKey,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Try a number!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 28.0),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Number..',
                          ),
                          validator: (String value) {
                            final int parsedValue = int.tryParse(value);
                            if (parsedValue == null) {
                              return 'Enter a number';
                            }
                            if (parsedValue < 1 || parsedValue > 100) {
                              return 'Number not in range';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            setState(() => _currentNumber = int.parse(value));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        if (_isFinished == true)
                          RaisedButton(
                            child: const Text('Reset'),
                            onPressed: _resetGame,
                            color: Colors.blue,
                          )
                        else
                          RaisedButton(
                            child: const Text('Guess'),
                            onPressed: _submitForm,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
