import 'package:flutter/material.dart';

import 'constants/palette.dart';
import 'constants/sizes.dart';

class UI {
  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide:
        BorderSide(color: Palette.kPrimaryColor.withOpacity(0.5), width: 1),
    borderRadius: BorderRadius.circular(Sizes.defaultPadding * 0.5),
  );

  static BoxDecoration boxDecoration(Color color, double opacity,
      {double radius = Sizes.defaultBorderRaduis}) {
    return BoxDecoration(
      color: color.withOpacity(opacity),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
        bottomLeft: const Radius.circular(Sizes.defaultBorderRaduis),
        bottomRight: const Radius.circular(Sizes.defaultBorderRaduis),
      ),
      border: Border.all(color: color.withOpacity(0.2)),
    );
  }

  static OutlineInputBorder containerBorder(color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.defaultBorderRaduis),
      ),
    );
  }
}
