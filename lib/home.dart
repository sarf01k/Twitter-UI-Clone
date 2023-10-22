import 'package:flutter/material.dart';
import 'package:twitter/search.dart';
import 'communities.dart';
import 'feed.dart';
import 'messages.dart';
import 'model/user.dart';
import 'notifications.dart';
import 'drawer_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final screens = const [ Feed(), Search(), Communities(), Notifications(), Messages() ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500
        ),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Hime'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Hime'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Hime'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Hime'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Hime'
          )
        ],
      ),
    );
  }
}