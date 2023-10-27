import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'pfp.dart';
import 'providers.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ProfilePic(),
                      Image.asset('assets/icons/more-circle.png', color: Colors.black)
                    ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(app.user.displayName, style: displayName),
                      Text('@${app.user.username}', style: userName),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${app.user.followingCount}', style: followCount),
                      const Text(' Following   ', style: follow),
                      Text('${app.user.followersCount}', style: followCount),
                      const Text(' Followers', style: follow)
                    ],
                  )
                ]
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  children:  <Widget>[
                    drawerTile('assets/icons/profile.png', 'Profile'),
                    drawerTile('assets/icons/badge.png', 'Blue'),
                    drawerTile('assets/icons/bookmark.png', 'Bookmarks'),
                    drawerTile('assets/icons/list.png', 'Lists'),
                    drawerTile('assets/icons/audio.png', 'Spaces'),
                    drawerTile('assets/icons/money.png', 'Monetisation'),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          const Divider(),
                          const ListTile(leading: Icon(Icons.rocket_launch_outlined, color: Colors.black),title: Text('For Professionals', style: drawerTitle)),
                          drawerTile('assets/icons/settings.png', 'Settings'),
                          const ListTile(leading: Icon(Icons.help_outline, color: Colors.black, size: 25),title: Text('Help and Feedback', style: drawerTitle))
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile drawerTile(iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Colors.black), title: Text(title, style: drawerTitle));
}