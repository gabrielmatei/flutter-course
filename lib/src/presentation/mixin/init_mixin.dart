import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_course/src/init/init.dart';
import 'package:flutter_course/src/models/index.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    final List<dynamic> result = await ConcatStream<dynamic>(<Stream<dynamic>>[
      init().asStream(),
      Future<void>.delayed(const Duration(seconds: 2)).asStream(),
    ]).toList();

    _completer.complete(result[0]);
  }

  Future<Store<AppState>> get future => _completer.future;
}
