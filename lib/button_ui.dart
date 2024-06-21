import 'dart:ui';

class ButtonUi {
  Color color;
  final String audioPath;
  bool isSelected;

  ButtonUi(this.audioPath, this.color, {this.isSelected = false});
}
