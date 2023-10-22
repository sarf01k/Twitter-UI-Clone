import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: Colors.blue,  // Twitter's primary blue color
  hintColor: Colors.blue,     // Also Twitter's blue for accents
  scaffoldBackgroundColor: Colors.white, // Twitter's background color

  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
    ),
  ),

  appBarTheme: AppBarTheme(
    color: Colors.white,  // White app bar
    elevation: 0,        // No elevation
    titleTextStyle: TextStyle(
      color: Colors.black
    ),
    iconTheme: IconThemeData(
      color: Colors.black,  // Twitter's blue for icons
    ),
  ),

  tabBarTheme: TabBarTheme(
    labelColor: Colors.blue,
    unselectedLabelColor: Colors.grey,
  ),

  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all(Colors.blue),
  //     textStyle: MaterialStateProperty.all(TextStyle(
  //       color: Colors.white,
  //     )),
  //   ),
  // ),
);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
    accentColor: Colors.blue
  )
);