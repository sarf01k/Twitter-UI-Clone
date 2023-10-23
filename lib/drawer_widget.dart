import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(app.user.displayName),
                        Text('@${app.user.username}'),
                      ],
                    )
                  ),
                  Row(
                    children: [
                      Text('${app.user.followingCount}'),
                      Text(' Following   ', style: TextStyle(color: Colors.grey)),
                      Text('${app.user.followersCount}'),
                      Text(' Followers', style: TextStyle(color: Colors.grey))
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
                    drawerTile('assets/icons/money.png', 'Monetization'),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            const Divider(),
                            const ListTile(leading: Icon(Icons.rocket_launch_outlined, color: Colors.black),title: Text('For Professionals')),
                            drawerTile('assets/icons/settings.png', 'Settings'),
                            const ListTile(leading: Icon(Icons.help_outline, color: Colors.black, size: 25),title: Text('Help and Feedback'))
                          ],
                        )
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

  ListTile drawerTile(iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Colors.black), title: Text(title));
}