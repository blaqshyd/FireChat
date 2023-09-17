import 'package:flutter/material.dart';

import 'app_exports.dart';

class AppConstants {
  AppConstants._();

  //! App Bar
  static AppBar appBar({Widget? child, List<Widget>? actions}) {
    return AppBar(
      title: child ??
          const Icon(
            Iconsax.twitch_copy,
            size: 38,
          ),
      actions: actions,
    );
  }

  //! Padding
  static EdgeInsets padding = const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 12,
  );
  //! BorderRadius

  static BorderRadius borderRadius = BorderRadius.circular(12);
}
