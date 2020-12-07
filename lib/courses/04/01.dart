import 'dart:async';

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
  double _time;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _time = 80.0;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _onTick(Timer timer) {
    print('${timer.tick}');
    setState(() {
      if (_time.toInt() == 1) {
        _doSomething();
        timer.cancel();
      }
      _time--;
    });
  }

  void _doSomething() {
    // play sound
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Course'),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: _time,
            min: 0.0,
            max: 300.0,
            onChanged: timer != null && timer.isActive
                ? null
                : (double value) {
                    setState(() => _time = value);
                  },
          ),
          Text('${_time.toInt()} s'),
          FlatButton(
            child: const Text('Start'),
            onPressed: () {
              timer = Timer.periodic(const Duration(seconds: 1), _onTick);
            },
          ),
          FlatButton(
            child: const Text('Stop'),
            onPressed: () {
              if (timer != null) {
                timer.cancel();
              }
              setState(() {
                timer = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
