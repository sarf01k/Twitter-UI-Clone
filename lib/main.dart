import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'theme.dart';
import 'providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => App(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter UI Clone',
      theme: lightMode,
      darkTheme: darkMode,
      home: const Home(),
    );
  }
}