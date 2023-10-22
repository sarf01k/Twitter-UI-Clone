import 'package:flutter/material.dart';
import 'package:twitter/drawer_widget.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SafeArea(
        child: DrawerWidget()
      ),
      body: Center(
        child: Text('Messages'),
      )
    );
  }
}