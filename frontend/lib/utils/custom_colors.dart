import 'package:flutter/material.dart';

class CustomColors {
  static const primaryBlue = Color(0xFF75B3E1);
  static const primaryPink = Color(0xFF7A5C95);
  static const primaryBrown = Color(0xFFF6DDBE);
}

class GlobalThemeData {
  static const primaryBlue = Color(0xFF75B3E1); // Light Blue
  static const primaryPink = Color(0xFF7A5C95); // Soft Pink
  static const primaryBrown = Color(0xFFF6DDBE); // Beige

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: CustomColors.primaryPink,
    onPrimary: Colors.white, // White for text on primary blue
    secondary: Color(0xFFD3EAF2), // Muted blue for secondary
    onSecondary: Color(0xFF322942), // Dark text for secondary
    error: Colors.redAccent,
    onError: Colors.white,
    surface: primaryBrown, // Beige as surface for warmth
    onSurface: Color(0xFF241E30), // Dark gray for text
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: primaryPink,
    onPrimary: Colors.white, // White for text on pink
    secondary: Color(0xFF5A3D6E), // Deeper pink for secondary
    onSecondary: Colors.white, // White for text on secondary
    error: Colors.redAccent,
    onError: Colors.white,
    surface: Color(0xFF2C2135), // Dark gray for surface
    onSurface: Colors.black, // White text on surface
    brightness: Brightness.dark,
  );
}
