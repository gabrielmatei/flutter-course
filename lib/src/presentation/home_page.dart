import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/src/actions/get_photos.dart';
import 'package:flutter_course/src/actions/set_query.dart';
import 'package:flutter_course/src/containers/is_loading_container.dart';
import 'package:flutter_course/src/containers/photos_container.dart';
import 'package:flutter_course/src/containers/query_container.dart';
import 'package:flutter_course/src/models/app_state.dart';
import 'package:flutter_course/src/models/photo.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhotosContainer(
      builder: (BuildContext context, List<Photo> photos) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Photo Gallery'),
          ),
          body: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  QueryContainer(
                    builder: (BuildContext context, String query) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: query,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            hintText: 'Enter a search term',
                          ),
                          onChanged: (String value) {
                            StoreProvider.of<AppState>(context)
                              ..dispatch(SetQuery(value))
                              ..dispatch(GetPhotos.start(value, 1));
                          },
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          StaggeredGridView.countBuilder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            itemCount: photos.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Photo photo = photos[index];
                              return Card(
                                child: Column(
                                  children: <Widget>[
                                    Image.network(photo.urls.thumb),
                                  ],
                                ),
                              );
                            },
                            staggeredTileBuilder: (int index) {
                              return const StaggeredTile.fit(2);
                            },
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                          ),
                          IsLoadingContainer(
                            builder: (BuildContext context, bool isLoading) {
                              if (isLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              return FlatButton(
                                child: const Text('Load more'),
                                onPressed: () {
                                  final Store<AppState> store = StoreProvider.of<AppState>(context);
                                  store.dispatch(GetPhotos.start(store.state.query, store.state.page));
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
