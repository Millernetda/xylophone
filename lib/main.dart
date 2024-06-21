import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'button_ui.dart';

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

class Xylophone extends StatefulWidget {
  Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final List<ButtonUi> _buttons = [
    ButtonUi("note1.wav", Colors.black),
    ButtonUi("note2.wav", Colors.green),
    ButtonUi("note3.wav", Colors.red),
    ButtonUi("note4.wav", Colors.blue),
  ];

  final _player = AudioCache();

  void _playSound(String audioPath) {
    _player.loop(audioPath);
  }

  Expanded getSoundButton(ButtonUi button, int index) {
    return Expanded(
      child: TextButton(
        onLongPress: () {
          setState(() {
            _buttons[index].isSelected = true;
          });
        },
        onPressed: () {
          _playSound(button.audioPath);
        },
        child: Container(
          margin: _buttons[index].isSelected ? EdgeInsets.all(12) : null,
          decoration: BoxDecoration(
            color: button.color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              _reGenerateColor();
            },
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              _addNewSound();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              _removeSound();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Column(
        children: [
          for (int i = 0; i < _buttons.length; i++)
            getSoundButton(_buttons[i], i),
        ],
      ),
    );
  }

  void _reGenerateColor() {
    final index = Random().nextInt(_buttons.length);
    final r = Random().nextInt(255);
    final g = Random().nextInt(255);
    final b = Random().nextInt(255);
    _buttons[index].color = Color.fromRGBO(r, g, b, 1);
    setState(() {});
  }

  void _addNewSound() {
    _buttons.add(ButtonUi(
      "note${_buttons.length + 1}.wav",
      Colors.black,
      isSelected: false,
    ));
    setState(() {});
  }

  void _removeSound() {
    if (_buttons.isNotEmpty) {
      setState(() {
        _buttons.removeWhere((element) => element.isSelected);
      });
    }
  }
}
