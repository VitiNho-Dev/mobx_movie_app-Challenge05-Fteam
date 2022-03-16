import 'package:flutter/cupertino.dart';

class ChangeColor extends ValueNotifier<bool> {
  ChangeColor() : super(false);

  void changeColor() {
    value = !value;
    notifyListeners();
  }
}
