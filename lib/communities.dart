import 'package:flutter/material.dart';
import 'package:twitter/drawer_widget.dart';

class Communities extends StatelessWidget {
  const Communities({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SafeArea(
        child: DrawerWidget()
      ),
    );
  }
}