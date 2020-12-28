library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_course/courses/05/src/models/index.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Movie,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
