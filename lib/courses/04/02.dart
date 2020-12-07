import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

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

class Flag {
  Flag({
    @required this.name,
    @required this.url,
  });

  final String name;
  final String url;
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  List<Flag> _flags;

  @override
  void initState() {
    super.initState();
    _getFlags();
  }

  Future<List<Flag>> _fetchFlags() async {
    final List<Flag> flags = <Flag>[];

    const String url = 'https://www.worldometers.info/geography/flags-of-the-world/';
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final String data = response.body;

      final List<String> parts = data.split('<a href="/img/flags/').skip(1).toList();
      for (final String part in parts) {
        final String file = 'https://www.worldometers.info/img/flags/${part.substring(0, part.indexOf('"'))}';
        final String name = part.split('10px">')[1].split('<')[0];

        flags.add(Flag(
          name: name,
          url: file,
        ));
      }
    }

    return flags;
  }

  Future<void> _getFlags() async {
    setState(() => _isLoading = true);

    _flags = await _fetchFlags();

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Course'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _flags.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          _flags[index].url,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(_flags[index].name),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
