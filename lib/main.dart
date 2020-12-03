import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Phrases'),
      ),
      body: Center(
        child: RaisedButton(
          child: const Text('Hello!'),
          onPressed: () {
            const String uri = 'assets/audio/hello.mp3';
            
            final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

            assetsAudioPlayer.open(Audio(uri));
            assetsAudioPlayer.play();
          },
        ),
      ),
    );
  }
}
