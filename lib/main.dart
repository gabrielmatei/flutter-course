import 'package:flutter/material.dart';
import 'package:flutter_course/components/movie_card.dart';
import 'package:flutter_course/components/movie_genre_filter.dart';
import 'package:flutter_course/components/movie_quality_filter.dart';
import 'package:flutter_course/services/movie_service.dart';

import 'components/movie_rating_filter.dart';
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
  final MovieService _movieService = MovieService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, bool> _qualityFilters;
  double _minimumRatingFilter;
  List<String> _genreFilters;
  String _genreFilter;

  bool _isLoading = false;
  List<Movie> _movies = <Movie>[];

  @override
  void initState() {
    super.initState();
    _resetFilters();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    setState(() => _isLoading = true);
    _movies = await _movieService.getMovies(_qualityFilters, _genreFilter, _minimumRatingFilter);
    setState(() => _isLoading = false);
  }

  void _resetFilters() {
    setState(() {
      _qualityFilters = _movieService.getQualityFilters();
      _minimumRatingFilter = 0.0;
      _genreFilter = '';
      _genreFilters = _movieService.getGenreFilters();
    });
  }

  Widget _buildAppBar() {
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

  Widget _buildFilterDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Filters',
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
                FlatButton(
                  child: const Text('Reset filters'),
                  onPressed: _resetFilters,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  MovieQualityFilter(
                    options: _qualityFilters,
                    onChanged: (String key, bool value) {
                      setState(() => _qualityFilters[key] = value);
                    },
                  ),
                  const Divider(),
                  MovieRatingFilter(
                    selectedOption: _minimumRatingFilter,
                    onChanged: (double rating) {
                      setState(() => _minimumRatingFilter = rating);
                    },
                  ),
                  const Divider(),
                  MovieGenreFilter(
                    options: _genreFilters,
                    selectedOption: _genreFilter,
                    onChanged: (String value) {
                      setState(() => _genreFilter = value);
                    },
                  ),
                ],
              ),
            ),
            FlatButton(
              child: const Text('Filter'),
              color: Colors.green,
              padding: const EdgeInsets.all(16.0),
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

  Widget _buildActiveFilters() {
    final List<String> filters = <String>[];

    if (_genreFilter != '') {
      filters.add(_genreFilter);
    }
    if (_minimumRatingFilter > 0.0) {
      filters.add('${_minimumRatingFilter * 2}');
    }
    _qualityFilters.forEach((String key, bool value) {
      if (value) {
        filters.add(key);
      }
    });

    return SizedBox(
      height: filters.isNotEmpty ? 50 : 0,
      child: ListView.builder(
        // shrinkWrap: true,
        padding: const EdgeInsets.only(left: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Chip(
              label: Text(filters[index]),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildActiveFilters(),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: _movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCard(_movies[index]);
                    },
                  ),
          )
        ],
      ),
      endDrawer: _buildFilterDrawer(),
    );
  }
}
