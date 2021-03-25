import 'package:flutter/material.dart';

final headline4TextSize = 34.0;
final headline5TextSize = 24.0;
final headine6TextSize = 22.0;
final body1TextSize = 18.0;
final subtitle1TextSize = 18.0;
final subtitle2TextSize = 16.0;
final overlineTextSize = 16.0;
final buttonTextSize = 16.0;

final Color textLight100 = Color.fromRGBO(255, 255, 255, 1.0);
final Color textLight85 = Color.fromRGBO(205, 209, 217, 1.0);
final Color textLight60 = Color.fromRGBO(122, 133, 153, 1.0);
final Color textdark40 = Color.fromRGBO(51, 68, 102, 1.0);
final Color textdark20 = Color.fromRGBO(4, 20, 51, 1.0);
final Color lineColor = Color.fromRGBO(237, 239, 242, 1.0);
final Color background100 = Color.fromRGBO(255, 255, 255, 1.0);
final Color primaryColorTint = Color.fromRGBO(184, 213, 216, 1.0);
final Color background98 = Color.fromRGBO(245, 247, 250, 1.0);

final String fontNameDefault = 'Heebo';

final appBarTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontWeight: FontWeight.w500,
  fontSize: headine6TextSize,
  color: textLight100,
);

final headling4TextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: headline4TextSize,
  fontWeight: FontWeight.w700,
  color: textdark20,
);
final headling6TextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: headine6TextSize,
  fontWeight: FontWeight.w700,
  color: textdark20,
);

final body1TextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: body1TextSize,
  fontWeight: FontWeight.normal,
  color: textLight60,
  height: 1.6,
);

final subtitle1TextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: subtitle1TextSize,
  fontWeight: FontWeight.w500,
  color: textLight60,
  height: 1.6,
);
final subtitle2TextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: subtitle2TextSize,
  fontWeight: FontWeight.w500,
  color: textLight60,
  height: 1.6,
);
final overlineTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: overlineTextSize,
  fontWeight: FontWeight.w500,
  color: textLight60,
  height: 1.6,
);

final buttonTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: buttonTextSize,
  fontWeight: FontWeight.w700,
  color: textLight100,
  letterSpacing: 1.0,
);

final hintTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  fontSize: body1TextSize,
  fontWeight: FontWeight.normal,
  color: textLight85,
  height: 1.6,
);

final labelTextStyle = TextStyle(
  fontFamily: fontNameDefault,
  color: textLight85,
);
