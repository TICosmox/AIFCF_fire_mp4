import 'package:flutter/material.dart';
import '../utils/SizeConfig.dart';

ThemeData themeModeLight() {
  return ThemeData(
    fontFamily: 'Lato',
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.blue[900],
      secondary: const Color.fromARGB(255, 80, 106, 199),
    ),
    primaryColorLight: const Color(0xFF14273F),
    scaffoldBackgroundColor: const Color(0xFFF1F3FF),
    dividerColor: const Color(0xFFD9E2E9),
    backgroundColor: const Color(0xFFF7F9FF),

    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Color.fromARGB(255, 13, 71, 161)),
      titleSmall: TextStyle(color: Colors.red),
      //bodyText1: TextStyle(color: Color.fromARGB(255, 90, 167, 3), fontFamily: 'Hind')
      bodyLarge: TextStyle(color: Color.fromARGB(255, 38, 71, 0), fontFamily: 'Hind')
    ),

    inputDecorationTheme: InputDecorationTheme(
      
      prefixIconColor: Colors.blue[900],
      iconColor: Colors.blue[900],
      hintStyle: const TextStyle(color: Color.fromARGB(255, 81, 93, 206)),
      labelStyle: TextStyle(color: Colors.blue[900]),
      floatingLabelStyle: TextStyle(color: Colors.blue[900]),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.white)
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.blue),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )
    ),

    
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: SizeConfig.blockSizeVertical < 3.84 ? 10 : 20,
        fontWeight: FontWeight.bold),
      elevation: 0,
      shadowColor: const Color(0xFFBDBDBD),
      iconTheme: const IconThemeData(color: Colors.white)
    ),

    canvasColor: const Color(0xFFEAF1F7),
    cardColor: const Color(0xFFFFFFFF),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xFFF7F9FF),
      unselectedIconTheme: IconThemeData(color: Colors.blue[200], opacity: 1.0, size: 25),
      unselectedLabelStyle: const TextStyle(color: Color(0xff3d3d3d)),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: Colors.blue[900],
      selectedIconTheme:
          const IconThemeData(color: Color(0xFF15a251), opacity: 1.0, size: 30),
    ),

    buttonTheme: const ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.padded
    ),

    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      behavior: SnackBarBehavior.floating,
      elevation: 50,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
    //   contentPadding: EdgeInsets.zero,
      textColor: Color.fromARGB(255, 5, 47, 173),
      iconColor: Color.fromARGB(255, 5, 47, 173),
      minLeadingWidth: 2,
    //  minVerticalPadding: 15,
    ),

  );
}
