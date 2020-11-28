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
    // TODO
    setState(() {
      _isFinished = false;
      _initialNumber = 1 + _random.nextInt(100);
    });
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() => _guessResponse = 'You tried $_currentNumber\n');
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
              Text('Initial $_initialNumber'),
              if (_guessResponse != null)
                Text(
                  _guessResponse,
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
                            if (parsedValue == null) //
                              return 'Enter a number';
                            if (parsedValue < 1 || parsedValue > 100)
                              return 'Number not in range';
                            return null;
                          },
                          onSaved: (String value) {
                            setState(() => _currentNumber = int.parse(value));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        RaisedButton(
                          child: Text(_isFinished ? 'Reset' : 'Guess'),
                          onPressed: _isFinished ? _resetGame : _submitForm,
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
