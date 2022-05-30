

import 'package:flutter/material.dart';




// Color blue_ = Color(0xFF121859);
const Color darkBlue =  Color(0xFF0B0B2B);
 // Color bluelight = Color(0xff2c3fd4);
const Color white =  Color(0xffe8eaf6);
const Color white_ =  Color(0xb0e8eaf6);
const Color orange =  Color(0xffff8305);
const Color lightOrange =  Color(0xffffad66);


class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ThemeData().colorScheme.copyWith(
        primary: white,
        secondary: white_,
        tertiary: lightOrange,
        background: darkBlue,
        brightness: Brightness.light
    ),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: darkBlue,
    useMaterial3: false,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(),
);


  static final dark =ThemeData(
    brightness: Brightness.dark,
    colorScheme: ThemeData().colorScheme.copyWith(
    primary: const Color(0xff2c3fd4),
    onPrimary: Colors.black,
    brightness: Brightness.dark,
    ),
    backgroundColor: Colors.black.withOpacity(0.7),
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: false,
    fontFamily: 'Poppins',
    textTheme: const TextTheme(),
);
}