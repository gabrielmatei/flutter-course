import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  bool isRed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Course'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.animation),
              onPressed: () {
                setState(() => isRed = !isRed);
              },
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {},
                ),
                Material(
                  shape: const CircleBorder(),
                  elevation: 4.0,
                  color: Colors.red,
                  child: Container(
                    child: const Text('13'),
                  ),
                ),
              ],
            )
          ],
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ],
        ));
  }
}
