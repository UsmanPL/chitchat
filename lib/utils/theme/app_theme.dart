import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const primaryColor = Color(0xFF5067F2);

  static ThemeData data() => ThemeData(
        primaryColor: primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,

        // Defining theme of the widgets.
        appBarTheme: _appBarTheme(),
        textTheme: _textTheme(),
        tabBarTheme: _tabBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        popupMenuTheme: _popUpMenuThemeData(),
        cupertinoOverrideTheme: _cupertinoOverrideTheme(),
        textSelectionTheme: _textSelectionTheme(),
        textButtonTheme: _textButtonTheme(),
        scrollbarTheme: _scrollbarTheme(),
        checkboxTheme: _checkBoxThemeData(),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        outlinedButtonTheme: _outlinedButtonThemeData(),
        expansionTileTheme: _expansionTileThemeData(),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF364EDA),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFDEE0FF),
          onPrimaryContainer: Color(0xFF000E5E),
          secondary: Color(0xFF5B5D72),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFE0E1F9),
          onSecondaryContainer: Color(0xFF181A2C),
          tertiary: Color(0xFF77536D),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFFFD7F1),
          onTertiaryContainer: Color(0xFF2D1227),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410002),
          background: Color(0xFFFFFBFF),
          onBackground: Color(0xFF1B1B1F),
          surface: Color(0xFFFFFBFF),
          onSurface: Color(0xFF1B1B1F),
          surfaceVariant: Color(0xFFE3E1EC),
          onSurfaceVariant: Color(0xFF46464F),
          outline: Color(0xFF767680),
          onInverseSurface: Color(0xFFF3F0F4),
          inverseSurface: Color(0xFF303034),
          inversePrimary: Color(0xFFBBC3FF),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF364EDA),
          outlineVariant: Color(0xFFC7C5D0),
          scrim: Color(0xFF000000),
        ),
      );

  static AppBarTheme _appBarTheme() => const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryColor,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: primaryColor,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      );

  static TextTheme _textTheme() => const TextTheme(
        displayLarge: TextStyle(
            height: 1.0,
            fontSize: 96,
            color: Colors.white,
            letterSpacing: -1.5,
            fontFamily: "Inter",
            fontWeight: FontWeight.normal),
        displayMedium: TextStyle(
          height: 1.2,
          fontSize: 60,
          color: Colors.black,
          letterSpacing: -0.5,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        displaySmall: TextStyle(
          height: 1.2,
          fontSize: 48,
          letterSpacing: 0,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        headlineMedium: TextStyle(
          height: 1.2,
          fontSize: 34,
          letterSpacing: 0.25,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        headlineSmall: TextStyle(
          height: 1.2,
          fontSize: 24,
          letterSpacing: 0,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
          height: 1.2,
          fontSize: 20,
          letterSpacing: 0.15,
          color: Colors.black,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          letterSpacing: 0.15,
          color: Color(0xFF323643),
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          letterSpacing: 0.1,
          color: Color(0xFF323643),
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          color: Color(0xFF323643),
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          letterSpacing: 0.25,
          color: Color(0xFF20262E),
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          letterSpacing: 1.25,
          color: Colors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          letterSpacing: 0.4,
          color: Colors.grey,
          fontFamily: "Inter",
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
      );

  static TabBarTheme _tabBarTheme() => TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "Inter",
          color: Colors.grey[500],
          fontWeight: FontWeight.w600,
        ),
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: primaryColor, width: 4),
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        fillColor: Colors.transparent,
        filled: true,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 13,
          fontFamily: 'Inter',
        ),
        border: OutlineInputBorder(
          // borderSide: const BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ),
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
          fontFamily: 'Inter',
        ),
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      );

  static CupertinoThemeData _cupertinoOverrideTheme() =>
      const CupertinoThemeData(
        primaryColor: primaryColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: primaryColor,
          actionTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  static ScrollbarThemeData _scrollbarTheme() => ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(
          Colors.white70,
        ),
      );

  static PopupMenuThemeData _popUpMenuThemeData() => PopupMenuThemeData(
        elevation: 15,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: "Inter",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey[300]!,
            width: 2,
          ),
        ),
      );

  static TextSelectionThemeData _textSelectionTheme() => TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionHandleColor: primaryColor,
        selectionColor: primaryColor.withOpacity(.1),
      );

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          textStyle: _textTheme().labelLarge,
          minimumSize: const Size(
            double.infinity, //sizeConfig.width(.85),
            55, //sizeConfig.height(.06),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          animationDuration: const Duration(milliseconds: 250),
        ),
      );

  static CheckboxThemeData _checkBoxThemeData() => CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  static OutlinedButtonThemeData _outlinedButtonThemeData() =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          textStyle: _textTheme().labelLarge,
          minimumSize: const Size(
            double.infinity, //sizeConfig.width(.85),
            55, //sizeConfig.height(.06),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          animationDuration: const Duration(milliseconds: 250),
          side: const BorderSide(width: 2.0, color: primaryColor),
        ),
      );

  static ExpansionTileThemeData _expansionTileThemeData() =>
      const ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
      );
}
