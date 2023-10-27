import 'package:flutter/material.dart';
import 'drawer_widget.dart';
import 'notifications.all.dart';
import 'notifications.mentions.dart';
import 'notifications.verified.dart';
import 'pfp.dart';
import 'theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SafeArea(
        child: DrawerWidget()
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  title: const Text('Notifications', style: screenTitle),
                  leading: const ProfilePic(),
                  actions: [
                    Image.asset('assets/icons/settings.png')
                  ],
                  bottom: const TabBar(
                    labelStyle: selectedLabel,
                    unselectedLabelStyle: unselectedLabel,
                    labelColor: Colors.black,
                    indicatorColor: Color(0xFF1C9BF0),
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                    indicatorWeight: 3,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Verified'),
                      Tab(text: 'Mentions')
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                AllNotifications(),
                VerifiedNotifications(),
                MentionNotifications()
              ],
            ),
          )
        )
      )
    );
  }
}