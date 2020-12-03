import 'package:meta/meta.dart';

class BasicPhrase {
  const BasicPhrase({
    @required this.text,
    @required this.audioUri,
  });

  final String text;
  final String audioUri;
}
