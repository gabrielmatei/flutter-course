library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_course/src/models/photo.dart';
import 'package:flutter_course/src/models/photo_urls.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Photo,
  PhotoUrls,
])
Serializers serializers = (_$serializers.toBuilder() //
      ..addPlugin(StandardJsonPlugin()))
    .build();
