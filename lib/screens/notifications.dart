import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';
import 'notifications.all.dart';
import 'notifications.mentions.dart';
import 'notifications.verified.dart';
import '../widgets/pfp.dart';
import '../themes/theme.dart';

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
                  title: Text('Notifications', style: Theme.of(context).brightness == Brightness.light ? screenTitle : screenTitleDark),
                  leading: const ProfilePic(),
                  actions: [
                    Image.asset('assets/icons/settings.png')
                  ],
                  bottom: TabBar(
                    labelStyle: selectedLabel,
                    unselectedLabelStyle: unselectedLabel,
                    labelColor: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                    indicatorColor: const Color(0xFF1C9BF0),
                    indicatorPadding: const EdgeInsets.symmetric(horizontal: 15),
                    indicatorWeight: 3,
                    tabs: const [
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