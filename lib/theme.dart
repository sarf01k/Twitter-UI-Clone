import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
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
    unselectedLabelColor: Colors.grey,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(),
  primarySwatch: Colors.blue,
  hintColor: Colors.blue,
  scaffoldBackgroundColor: Colors.black,

  appBarTheme: const AppBarTheme(
    color: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Colors.grey,
  ),
);

const screenTitle = TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
const screenTitleDark = TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);

const selectedLabel = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
const selectedLabelDark = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

const unselectedLabel = TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500);

const displayName = TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600);
const displayNameDark = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

const userName = TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400);

const tweetBody = TextStyle(color: Colors.black, fontSize: 16);
const tweetBodyDark = TextStyle(color: Colors.white, fontSize: 16);

const notifTag = TextStyle(color: Color(0xFF1C9BF0), fontSize: 16);

const followCount = TextStyle(color: Colors.black, fontSize: 16);
const followCountDark = TextStyle(color: Colors.white, fontSize: 16);

const follow = TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400);

const drawerTitle = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600);
const drawerTitleDark = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600);