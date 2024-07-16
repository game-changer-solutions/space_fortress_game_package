import 'package:flutter/material.dart';

import '../init.dart';

class AppTheme {
  static ThemeData apptheme = ThemeData(
    fontFamily: "BungeeInline",
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: false,
    colorScheme: integrationInitialized && primaryColor != null
        ? ColorScheme.fromSeed(seedColor: primaryColor!)
        : null,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: integrationInitialized && primaryColor != null
            ? primaryColor!
            : null,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return integrationInitialized && primaryColor != null
              ? primaryColor!
              : null;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return integrationInitialized && primaryColor != null
              ? primaryColor!.withOpacity(0.7)
              : null;
        }
        return integrationInitialized && primaryColor != null
            ? primaryColor!.withOpacity(0.3)
            : null;
      }),
    ),
  );
}
