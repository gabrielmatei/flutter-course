import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

import 'models/movie.dart';

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
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, bool> _qualityFilters;
  double _minimumRatingFilter;
  List<String> _genreFilters;
  String _genreFilter;

  bool _isLoading = false;
  final List<Movie> _movies = <Movie>[];

  @override
  void initState() {
    super.initState();
    _resetFilters();
    _fetchMovies();
  }

  void _resetFilters() {
    setState(() {
      _qualityFilters = <String, bool>{
        '720p': false,
        '1080p': false,
        '2160p': false,
        '3D': false,
      };
      _minimumRatingFilter = 0.0;
      _genreFilter = '';
      _genreFilters = <String>[
        'Action',
        'Adventure',
        'Animation',
        'Biography',
        'Comedy',
        'Crime',
        'Documentary',
        'Drama',
        'Family',
        'Fantasy',
        'Film Noir',
        'History',
        'Horror',
        'Music',
        'Musical',
        'Mystery',
        'Romance',
        'Sci-Fi',
        'Short Film',
        'Sport',
        'Superhero',
        'Thriller',
        'War',
        'Western',
      ];
    });
  }

  Future<void> _fetchMovies() async {
    setState(() => _isLoading = true);

    _movies.clear();

    final Uri uri = Uri.https('yts.mx', '/api/v2/list_movies.json}', <String, String>{
      'quality': _qualityFilters.keys.map((String key) => _qualityFilters[key] ? key : '').toList().join(''),
      'genre': _genreFilter,
      'minimum_rating': '${_minimumRatingFilter * 2}',
    });
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> moviesData = jsonData['data']['movies'];
      for (final dynamic movieData in moviesData) {
        _movies.add(Movie.fromJson(movieData));
      }
    }

    setState(() => _isLoading = false);
  }

  Widget _appBar() {
    return AppBar(
      title: const Text('Movie App'),
      backgroundColor: Colors.green,
      actions: <Widget>[
        FlatButton(
          child: const Text('Filters'),
          onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
        )
      ],
    );
  }

  Widget _filterDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Filters'),
                FlatButton(
                  child: const Text('Reset filters'),
                  padding: EdgeInsets.zero,
                  onPressed: _resetFilters,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  const Text('Quality'),
                  ..._qualityFilters.keys
                      .map((String key) => CheckboxListTile(
                            title: Text(key),
                            value: _qualityFilters[key],
                            onChanged: (bool value) {
                              setState(() => _qualityFilters[key] = value);
                            },
                          ))
                      .toList(),
                  const Text('Minimum rating'),
                  RatingBar.builder(
                    initialRating: _minimumRatingFilter,
                    minRating: 0,
                    itemCount: 5,
                    allowHalfRating: true,
                    itemBuilder: (BuildContext context, _) {
                      return const Icon(
                        Icons.star,
                        color: Colors.amber,
                      );
                    },
                    onRatingUpdate: (double rating) {
                      setState(() => _minimumRatingFilter = rating);
                    },
                  ),
                  const Text('Genre'),
                  ..._genreFilters
                      .map((String genre) => RadioListTile<String>(
                            title: Text(genre),
                            value: genre,
                            groupValue: _genreFilter,
                            onChanged: (String value) {
                              setState(() => _genreFilter = value);
                            },
                          ))
                      .toList(),
                ],
              ),
            ),
            FlatButton(
              child: const Text('Filter'),
              color: Colors.green,
              padding: EdgeInsets.zero,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: () {
                Navigator.of(context).pop();
                _fetchMovies();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              if (_genreFilter != '') Chip(label: Text(_genreFilter)),
              if (_minimumRatingFilter > 0.0) Chip(label: Text('${_minimumRatingFilter * 2}')),
              ..._qualityFilters.keys
                  .where((String key) => _qualityFilters[key])
                  .map((String key) => Chip(
                        label: Text(key),
                      ))
                  .toList(),
            ],
          ),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 2,
                    ),
                    itemCount: _movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Image.network(_movies[index].cover),
                            Text(_movies[index].title),
                            Text('${_movies[index].rating}'),
                            Row(
                              children: <Widget>[
                                ..._movies[index]
                                    .genres
                                    .map((String key) => Chip(
                                          label: Text(key),
                                        ))
                                    .toList(),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
      endDrawer: _filterDrawer(),
    );
  }
}
