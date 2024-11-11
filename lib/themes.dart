import 'package:flutter/material.dart';

const _textFieldBorderLight = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    strokeAlign: BorderSide.strokeAlignOutside,
    width: .5,
    color: Color(0xFFC8C8C8),
  ),
);

const _textFieldBorderDark = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(
    style: BorderStyle.solid,
    strokeAlign: BorderSide.strokeAlignOutside,
    width: .5,
    color: Color(0xFF414141),
  ),
);

class Themes {
  static bool isLightTheme(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor ==
        lightTheme.scaffoldBackgroundColor;
  }

  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor ==
        darkTheme.scaffoldBackgroundColor;
  }

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xFFC8C8C8),
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      border: _textFieldBorderLight,
      enabledBorder: _textFieldBorderLight,
      focusedBorder: _textFieldBorderLight,
      filled: true,
      fillColor: Color(0xFFFAFAFA),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xFFC8C8C8),
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      border: _textFieldBorderDark,
      enabledBorder: _textFieldBorderDark,
      focusedBorder: _textFieldBorderDark,
      filled: true,
      fillColor: Color(0xFF121212),
    ),
  );
}
