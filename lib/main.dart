import 'package:flutter/material.dart';

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

  Expanded getSoundButton(Color color) {
    return Expanded(
      child: TextButton(
        onPressed: (){},
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
          getSoundButton(Colors.red),
          getSoundButton(Colors.orange),
          getSoundButton(Colors.yellow),
          getSoundButton(Colors.green),
          getSoundButton(Colors.lightBlueAccent),
          getSoundButton(Colors.blue),
          getSoundButton(Colors.purple),
        ],
      ),
    );
  }
}

