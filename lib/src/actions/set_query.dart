library set_query;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_query.freezed.dart';

@freezed
abstract class SetQuery with _$SetQuery {
  const factory SetQuery(@nullable String query) = _SetQuery;
}
