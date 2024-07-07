import 'package:flutter/material.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF794A99),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFF3DAFF),
      onPrimaryContainer: Color(0xFF2F004C),
      secondary: Color(0xFF675A6E),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFEFDCF5),
      onSecondaryContainer: Color(0xFF221729),
      tertiary: Color(0xFF944171),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFFFD8E9),
      onTertiaryContainer: Color(0xFF3C0029),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFFFBFF),
      onBackground: Color(0xFF1D1B1E),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF1D1B1E),
      surfaceVariant: Color(0xFFEADFEA),
      onSurfaceVariant: Color(0xFF4B454D),
      outline: Color(0xFF7C747E),
      onInverseSurface: Color(0xFFF6EFF3),
      inverseSurface: Color(0xFF332F33),
      inversePrimary: Color(0xFFE3B5FF),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF794A99),
      outlineVariant: Color(0xFFCDC3CE),
      scrim: Color(0xFF000000),
    ),

// filledButtonTheme: FilledButtonThemeData(
    //     style: ButtonStyle(
    //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(12),
    // )))),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(12),
    // )))),
    // textButtonTheme: TextButtonThemeData(
    //     style: ButtonStyle(
    //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(4),
    // )))),
    // buttonTheme: ButtonThemeData(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.zero,
    //   ),
    // ),

    // filledButtonTheme: FilledButtonThemeData(
    //     style: ButtonStyle(
    //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
    //   borderRadius: BorderRadius.zero,
    // )))),
    // buttonTheme: ButtonThemeData(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.zero,
    //   ),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(backgroundColor: lightColorScheme.primary)),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFE3B5FF),
      onPrimary: Color(0xFF471867),
      primaryContainer: Color(0xFF5F3180),
      onPrimaryContainer: Color(0xFFF3DAFF),
      secondary: Color(0xFFD2C1D9),
      onSecondary: Color(0xFF382C3E),
      secondaryContainer: Color(0xFF4F4256),
      onSecondaryContainer: Color(0xFFEFDCF5),
      tertiary: Color(0xFFFFAFD7),
      onTertiary: Color(0xFF5B1141),
      tertiaryContainer: Color(0xFF772958),
      onTertiaryContainer: Color(0xFFFFD8E9),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF1D1B1E),
      onBackground: Color(0xFFE7E0E5),
      surface: Color(0xFF1D1B1E),
      onSurface: Color(0xFFE7E0E5),
      surfaceVariant: Color(0xFF4B454D),
      onSurfaceVariant: Color(0xFFCDC3CE),
      outline: Color(0xFF968E98),
      onInverseSurface: Color(0xFF1D1B1E),
      inverseSurface: Color(0xFFE7E0E5),
      inversePrimary: Color(0xFF794A99),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFE3B5FF),
      outlineVariant: Color(0xFF4B454D),
      scrim: Color(0xFF000000),
    ),
  );
}
