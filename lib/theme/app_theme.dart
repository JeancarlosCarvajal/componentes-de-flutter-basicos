


import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color Primario
    primaryColor: Colors.indigo,

    // Appbar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ), 

    //TextBottom theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary), 
    ),

    // FloatingActionButton Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5
    ),
    
    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.indigo,
        shape: const StadiumBorder(),
        elevation: 0
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
      )
    )

  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Color Primario
    primaryColor: Colors.indigo,

    // Background del scaffold
    scaffoldBackgroundColor: Colors.black,

    // Appbar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0
    ), 

    //TextBottom theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary), 
    ),


  );


}