import 'package:flutter/material.dart';

class CommonPadding {
  static const double verticalCommonPadding = 20.0;
  static const double horizontalCommonPadding = 20.0;

  static const EdgeInsets kHorizontalPadding = EdgeInsets.symmetric(
    horizontal: horizontalCommonPadding,
  );

  static const EdgeInsets kVerticalPadding = EdgeInsets.symmetric(
    vertical: verticalCommonPadding,
  );

  static EdgeInsets kCommonPadding = EdgeInsets.symmetric(
    vertical: verticalCommonPadding,
    horizontal: horizontalCommonPadding,
  );

  static const commonTextFieldPadding = EdgeInsets.symmetric(
    vertical: 14,
    horizontal: 20,
  );

  static EdgeInsetsGeometry copyWith(
    EdgeInsetsGeometry padding, {
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return EdgeInsets.only(
      top: top ?? padding.vertical,
      bottom: bottom ?? padding.vertical,
      left: left ?? padding.horizontal,
      right: right ?? padding.horizontal,
    );
  }
}
