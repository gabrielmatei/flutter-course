library set_color;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_color.freezed.dart';

@freezed
abstract class SetColor with _$SetColor {
  const factory SetColor(@nullable String color) = _SetColor;
}
