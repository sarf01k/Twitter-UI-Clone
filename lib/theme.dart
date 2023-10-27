import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: Colors.blue,
  hintColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),

  tabBarTheme: const TabBarTheme(
    labelColor: Colors.blue,
    unselectedLabelColor: Colors.grey,
  ),
);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
    accentColor: Colors.blue
  )
);

const screenTitle = TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
const selectedLabel = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
const unselectedLabel = TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500);
const displayName = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
const userName = TextStyle(color: Colors.grey, fontSize: 16);
const tweetBody = TextStyle(color: Colors.black, fontSize: 16);
const notifTag = TextStyle(color: Color(0xFF1C9BF0), fontSize: 16);
const followCount = TextStyle(color: Colors.black, fontSize: 16);
const follow = TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400);
const drawerTitle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600);