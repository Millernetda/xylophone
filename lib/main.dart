import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophonePage());
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Xylophone(),
      ),
    );
  }
}

class Xylophone extends StatelessWidget {
  // const Xylophone({Key? key}) : super(key: key);

  //method to invoke the press sound
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded getSoundButton(Color color, int soundNumber) {
    return Expanded(
      child: TextButton(
        onPressed: (){
          playSound(soundNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          getSoundButton(Colors.red, 1),
          getSoundButton(Colors.orange, 2),
          getSoundButton(Colors.yellow, 3),
          getSoundButton(Colors.green, 4),
          getSoundButton(Colors.lightBlueAccent, 5),
          getSoundButton(Colors.blue, 6),
          getSoundButton(Colors.purple, 7),
        ],
      ),
    );
  }
}

