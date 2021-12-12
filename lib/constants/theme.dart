import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData apptheme = ThemeData(
  primaryColor: primaryColor,
  textTheme: textTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// color
const Color accentColor = Color(0xff172B4C);
const Color secondaryAccentColor = Color(0xff1D3866);
const Color primaryColor = Color(0xffF45244);
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;
const Color lightGrey = Color(0xffEAEAEA);
Color whiteOpacity = Colors.white54;
const Color offWhite = Color(0xffE5E5E5);

// text theme
final TextTheme textTheme = GoogleFonts.poppinsTextTheme();

// elevated button theme
final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    primary: accentColor,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  ),
);

// outline button
final OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    primary: whiteColor,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
    side: const BorderSide(color: accentColor, width: 1.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),
    ),
    textStyle: TextStyle(
      fontFamily: textTheme.button!.fontFamily,
      fontSize: textTheme.button!.fontSize,
      color: blackColor,
    ),
  ),
);

//input decoration
const InputDecoration inputDecoration = InputDecoration(
  labelStyle: TextStyle(fontSize: 14),
  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
);

const InputDecoration addItemInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(10),
  hintStyle: TextStyle(fontWeight: FontWeight.bold),
  border: OutlineInputBorder(borderSide: BorderSide.none),
);

final BoxDecoration addItemContainerDecoration = BoxDecoration(
  color: whiteColor,
  borderRadius: BorderRadius.circular(15),
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ],
);
