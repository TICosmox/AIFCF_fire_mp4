// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:proyecto_reproductor_video/theme_config/theme.dart';

import '../utils/SizeConfig.dart';
// import 'package:google_fonts/google_fonts.dart';

ThemeData themeModeLight() {
  return ThemeData(
    fontFamily: 'Lato',
    colorScheme: const ColorScheme.light().copyWith(
      primary: const Color(0xFF15a251),
      primaryVariant: const Color(0xFF3e4a94),
      secondary: const Color(0xFF94c750),
      secondaryVariant: const Color(0xFF064857),
    ),
    primaryColorLight: const Color(0xFF14273F),
    scaffoldBackgroundColor: const Color(0xFFF1F3FF),
    dividerColor: const Color(0xFFD9E2E9),
    backgroundColor: const Color(0xFFF7F9FF),

    textTheme: const TextTheme(
      subtitle1: TextStyle(color: Color.fromRGBO(59, 173, 18, 1)),
      subtitle2: TextStyle(color: Colors.red),
      //bodyText1: TextStyle(color: Color.fromARGB(255, 90, 167, 3), fontFamily: 'Hind')
      bodyText1: TextStyle(color: Color.fromARGB(255, 38, 71, 0), fontFamily: 'Hind')
    ),
    
    appBarTheme: AppBarTheme(
      backgroundColor: getColorGreen(),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.blockSizeVertical < 3.84 ? 10 : 14,
        fontWeight: FontWeight.bold),
      elevation: 0,
      shadowColor: const Color(0xFFBDBDBD),
      iconTheme: const IconThemeData(color: Colors.white)
    ),

    canvasColor: const Color(0xFFEAF1F7),
    cardColor: const Color(0xFFFFFFFF),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFFF7F9FF),
      unselectedIconTheme:
          IconThemeData(color: Colors.green[200], opacity: 1.0, size: 25),
      unselectedLabelStyle: const TextStyle(color: Color(0xff3d3d3d)),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.green[900],
      selectedIconTheme:
          const IconThemeData(color: Color(0xFF15a251), opacity: 1.0, size: 30),
    ),

    buttonTheme: const ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded
    ),

    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: Color(0xFF94c750),
      iconColor: Color(0xFF94c750),
      hintStyle: TextStyle(color: Color(0xffA6B0BD)),
      labelStyle: TextStyle(color: Color.fromRGBO(66, 66, 66, 1)),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.white)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.white)
      ),
    ),

    snackBarTheme: const SnackBarThemeData(
      contentTextStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      behavior: SnackBarBehavior.floating,
      elevation: 50,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.green,
        primary: Colors.white,
        fixedSize: const Size.fromWidth(120)
      )
    ),

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: const Color(0xFFF7F9FF),
      unselectedIconTheme:
          const IconThemeData(color: Color(0xFFC58558)), //0xFFC58558
      unselectedLabelTextStyle: const TextStyle(color: Color(0xFFE6B09F)),
      selectedLabelTextStyle: const TextStyle(color: Color(0xFFF2F2F2)),
      selectedIconTheme: IconThemeData(
        size: SizeConfig.blockSizeVertical < 5.69 ? 20 : 28,
        color: const Color(0xff94c750),
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.green),
      checkColor: MaterialStateProperty.all(Colors.white),
    ),

    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.zero,
      textColor: Colors.green,
      minLeadingWidth: 2,
      minVerticalPadding: 15,
    ),

  );
}
