import 'package:flutter/material.dart';
import 'package:mymny/src/utils/constants/ui_constants.dart';

class AppTheme {
  static ThemeData theme({bool isDark = false}) => ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: kBorderRadiusSm),
            visualDensity: VisualDensity.comfortable,
          ),
        ),
        segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.comfortable,
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(borderRadius: kBorderRadiusSm),
            ),
          ),
        ),
      );
}
