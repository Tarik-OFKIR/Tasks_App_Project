//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// const Color blueClr = Color(0XFF1A237E);
// const Color bluishLightClr = Color(0XFF2c3FD4);
// const Color greenClr = Color(0XFF1DE9B6);
// const Color orangeClr = Color(0XFFFF8305);
// const Color withDark = Color(0XFFE8EAf6);
//
// const Color bluishClr = Color(0xFF4e5ae8);
// const Color yellowClr = Color(0xFFFFB746);
// const Color pinkClr = Color(0xFFff4667);
//
// const Color white = Colors.white;
// const primaryClr =blueClr ;
// const onPrimaryClr = bluishLightClr;
// const secondClr = withDark;
// const tertiaryClr = orangeClr;
// const Color darkGreyClr = Color(0xFF121212);
// const Color darkHeaderClr =  Color(0xFF424242);
//
// class Themes {
//   static final light= ThemeData(
//     colorScheme: ThemeData().colorScheme.copyWith(
//       primary: primaryClr,
//       onPrimary: onPrimaryClr,
//       onSecondary: secondClr,
//       onTertiary: tertiaryClr,
//       brightness: Brightness.light
//     ),
//       backgroundColor: Color(0xFF121859),
//       );
//   static final dark= ThemeData(
//     backgroundColor: darkGreyClr,
//         primaryColor: darkGreyClr,
//         brightness: Brightness.dark
//
//       );
// }
//
// TextStyle get subHeadingStyle{
//   return GoogleFonts.lato (
//     textStyle: TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//         color: Get.isDarkMode?Colors.grey[400]:Colors.grey
//
//     )
//   );
// }
// TextStyle get headingStyle{
//   return GoogleFonts.lato (
//       textStyle: TextStyle(
//           fontSize: 30,
//           fontWeight: FontWeight.bold,
//           color: Get.isDarkMode?Colors.white:Colors.black
//       )
//   );
// }
// TextStyle get titleStyle{
//   return GoogleFonts.lato (
//       textStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           color: Get.isDarkMode?Colors.white:Colors.black
//       )
//   );
// }
// TextStyle get subTitleStyle{
//   return GoogleFonts.lato (
//       textStyle: TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w400,
//           color: Get.isDarkMode? Colors.grey[100]:Colors.grey[600]
//       )
//   );
// }