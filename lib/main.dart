import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final int numNotes = 7;
  final xyloColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  // Plays note i
  void playNote(int i) {
    final player = AudioCache();
    player.play('note$i.wav');
  }

  // Returns a FlatButton that plays note i on press
  FlatButton createXyloBtn(int i) {
    return FlatButton(
      onPressed: () {
        playNote(i);
      },
      color: xyloColors[i - 1],
      child: null,
    );
  }

  // Returns a list of xylophone buttons each wrapped in an Expanded widget
  List<Widget> createXyloBtns() {
    List<Widget> result = [];

    for (int i = 1; i <= numNotes; i++) {
      result.add(Expanded(child: createXyloBtn(i)));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createXyloBtns(),
          ),
        ),
      ),
    );
  }
}
