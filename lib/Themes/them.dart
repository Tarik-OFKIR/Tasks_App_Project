

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';




// Color blue_ = Color(0xFF121859);
const Color darkBlue =  Color(0xFF0B0B2B);
 // Color bluelight = Color(0xff2c3fd4);
const Color white =  Color(0xffe8eaf6);
const Color white_ =  Color(0xb0babbc0);
const Color gray =  Color(0xff9b9c9f);
const Color orange =  Color(0xffff8305);
const Color lightOrange =  Color(0xff8b75fa);



// const Color bluishClr = Color(0xFF4e5ae8);
// const Color yellowClr = Color(0xFFFFB746);
// const Color pinkClr = Color(0xFFff4667);
const Color pinkClr = Color(0xfffa75a2);
const Color yellowClr = Color(0xffe4fa75);
const Color bluishClr = Color(0xff75facd);

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ThemeData().colorScheme.copyWith(
        primary:Colors.black ,
        secondary:Colors.black ,
        tertiary: lightOrange,
        // background: darkBlue,
        background: Colors.white,
        onBackground: gray,
        brightness: Brightness.light
    ),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
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
      textStyle:  TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Themes.light.colorScheme.tertiary
      )
  );
}
TextStyle get titleStyle{
  return GoogleFonts.lato (
      textStyle:  TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Themes.light.colorScheme.primary,
      )
  );
}
TextStyle get subTitleStyle{
  return GoogleFonts.lato (
      textStyle:  TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Themes.light.colorScheme.onBackground,
      )
  );
}