import 'package:flutter/material.dart';

class Styles {
  static Color primaryColor = Color(0xFF05C687);
  static Color primaryColorLight = Color(0xFFF6F6F6);
  static Color primaryColorDark = Color(0xFF818181);
  static Color accentColor = Color(0xFF004174);
  static Color otpColor = Color(0xFF19BDC2);
  static Color inputGray = Color(0xFF9AAAB8);
  static Color lightGray = Colors.grey[100];
  static Color mediumGray = Colors.grey[200];
  static Color disabledBorderColor = Color(0x889AAAB8);
  static Color otpContainerOpened = Color(0xFFF3F3F3);

  static Color appPrimaryColor = Colors.blue;

  static const double PADDING_SIZE = 8.0;

  static double fontSizeScale(Size size) {
    double _fontSizeScale = 1.0;
    if (size.width <= 370) {
      _fontSizeScale = 0.75;
    } else if (size.width <= 500) {
      _fontSizeScale = 0.9;
    }

    return _fontSizeScale;
  }

  static EdgeInsets getMainEdgeInsets() {
    return EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0);
  }

  static ThemeData getDefaultThemeData(BuildContext context) {
    double width = WidgetsBinding.instance.window.physicalSize.width;
    double height = WidgetsBinding.instance.window.physicalSize.height;
    double pixelRatio = WidgetsBinding.instance.window.devicePixelRatio;
    Size size = Size(width / pixelRatio, height / pixelRatio);
    double fontSizeFactor = fontSizeScale(size);
    return ThemeData(
      scaffoldBackgroundColor: primaryColorLight,
      appBarTheme: AppBarTheme(
        color: primaryColorLight,
        iconTheme: IconThemeData(color: Styles.inputGray),
      ),
      // Define the default brightness and colors.
      brightness: Brightness.light,
      backgroundColor: Color(0xFF07294B),
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorDark: primaryColorDark,
      accentColor: accentColor,
      cursorColor: primaryColor,
      dividerColor: Colors.blueGrey[350],

      buttonColor: primaryColor,
      // Define the default font family.
      fontFamily: 'Open Sans',

      textTheme: getTextTheme(fontSizeFactor),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        height: 54,
        padding: EdgeInsets.symmetric(horizontal: 24),
      ),
    );
  }

  static double getSizeFactor(String sizeName) {
    double sizeFactor;

    if (sizeName == "big")
      sizeFactor = 3 / 4;
    else {
      sizeFactor = 7 / 10;
    }

    return sizeFactor;
  }

  static TextTheme getTextTheme(double fontSizeFactor) {
    return TextTheme(
      headline1: TextStyle(
        color: primaryColor,
        fontSize: 24 * fontSizeFactor,
        height: 1.35,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: primaryColorLight,
        fontSize: 24 * fontSizeFactor,
        height: 1.35,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: inputGray,
        fontSize: 12.0 * fontSizeFactor,
        fontWeight: FontWeight.w400,
      ),
      headline5: TextStyle(
        color: primaryColor,
        fontSize: 16.0 * fontSizeFactor,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: accentColor,
        fontSize: 22 * fontSizeFactor,
        height: 1.35,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: primaryColorDark,
        fontSize: 14 * fontSizeFactor,
        height: 1.35,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        color: primaryColorLight,
        fontSize: 16.0 * fontSizeFactor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
