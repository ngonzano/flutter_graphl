import 'package:flutter/material.dart';

ButtonStyle buildButtonStyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
  );
}

ButtonStyle buildButtonStyleCheck() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.grey),
  );
}
