import 'package:flutter/material.dart';

class WidgetStateUtil {
  static WidgetStateProperty<Color> colorProperty(Color color) {
    return WidgetStateProperty.all(color);
  }
}
