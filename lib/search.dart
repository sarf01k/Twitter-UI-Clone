import 'package:flutter/material.dart';
import 'package:twitter/drawer_widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SafeArea(
        child: DrawerWidget()
      ),
      body: Center(
        child: Text('Search'),
      )
    );
  }
}