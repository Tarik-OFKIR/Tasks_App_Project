

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';




// Color blue_ = Color(0xFF121859);
const Color darkBlue =  Color(0xFF0B0B2B);
 // Color bluelight = Color(0xff2c3fd4);
const Color white =  Color(0xffe8eaf6);
const Color white_ =  Color(0xb0e8eaf6);
const Color orange =  Color(0xffff8305);
const Color lightOrange =  Color(0xffffad66);



const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);


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



TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
      textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: white_,

      )
  );
}
TextStyle get headingStyle{
  return GoogleFonts.lato (
      textStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: white_
      )
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato (
      textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: white_
      )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato (
      textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: white_
      )
  );
}