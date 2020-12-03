import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/models/basic_phrase.dart';
import 'package:flutter_course/models/basic_phrase_translation.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BasicPhraseTranslation> basicPhraseTranslations =
      <BasicPhraseTranslation>[
    const BasicPhraseTranslation(
      romanian: BasicPhrase(
        text: 'Salut',
        audioUri: 'assets/audio/salut.mp3',
      ),
      english: BasicPhrase(
        text: 'Hello',
        audioUri: 'assets/audio/hello.mp3',
      ),
    ),
    const BasicPhraseTranslation(
      romanian: BasicPhrase(
        text: 'Ce mai faci?',
        audioUri: 'assets/audio/ce_mai_faci.mp3',
      ),
      english: BasicPhrase(
        text: 'How are you?',
        audioUri: 'assets/audio/how_are_you.mp3',
      ),
    ),
    const BasicPhraseTranslation(
      romanian: BasicPhrase(
        text: 'Sunt bine',
        audioUri: 'assets/audio/sunt_bine.mp3',
      ),
      english: BasicPhrase(
        text: 'I\'m fine',
        audioUri: 'assets/audio/im_fine.mp3',
      ),
    ),
    const BasicPhraseTranslation(
      romanian: BasicPhrase(
        text: 'Ma numesc',
        audioUri: 'assets/audio/ma_numesc.mp3',
      ),
      english: BasicPhrase(
        text: 'My name is',
        audioUri: 'assets/audio/my_name_is.mp3',
      ),
    ),
  ];

  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
  }

  void _playAudio(String uri) {
    _assetsAudioPlayer.open(Audio(uri));
    _assetsAudioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
      ),
      body: ListView.builder(
          itemCount: basicPhraseTranslations.length,
          itemBuilder: (_, int index) {
            final BasicPhraseTranslation currentTranslation =
                basicPhraseTranslations[index];
            return Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(currentTranslation.romanian.text),
                    onPressed: () =>
                        _playAudio(currentTranslation.romanian.audioUri),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text(currentTranslation.english.text),
                    onPressed: () =>
                        _playAudio(currentTranslation.english.audioUri),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
