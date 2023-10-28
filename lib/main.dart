import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/themes/theme.dart';
import 'screens/home.dart';
import 'providers/providers.dart';

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
    final themeProvider = Provider.of<App>(context);
    return MaterialApp(
      title: 'Twitter UI Clone',
      themeMode: themeProvider.themeMode,
      theme: lightMode,
      darkTheme: darkMode,
      home: const Home(),
    );
  }
}