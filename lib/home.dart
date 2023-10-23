import 'package:flutter/material.dart';
import 'package:twitter/search.dart';
import 'communities.dart';
import 'feed.dart';
import 'messages.dart';
import 'notifications.dart';

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
        showUnselectedLabels: false,
        showSelectedLabels: false,
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
        items: [
          bottomAppBarIcon('assets/icons/home.png', 'Home', 'assets/icons/home-filled.png'),
          bottomAppBarIcon('assets/icons/search.png', 'Search', 'assets/icons/search-filled.png'),
          bottomAppBarIcon('assets/icons/communities.png', 'Communities', 'assets/icons/communities-filled.png'),
          bottomAppBarIcon('assets/icons/notification.png', 'Notifications', 'assets/icons/notification-filled.png'),
          bottomAppBarIcon('assets/icons/message.png', 'Messages', 'assets/icons/message-filled.png')
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomAppBarIcon(iconPath, label, activeIconPath) {
    return BottomNavigationBarItem(
      icon: Image.asset(iconPath, scale: 1, color: Colors.black),
      label: label,
      activeIcon: Image.asset(activeIconPath, scale: 1, color: Colors.black),
    );
  }
}