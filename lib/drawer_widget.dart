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
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
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
                      Image.asset('assets/icons/more-circle.png', color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white)
                    ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(app.user.displayName, style: displayNameDark),
                      Text('@${app.user.username}', style: userName),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${app.user.followingCount}', style: followCountDark),
                      const Text(' Following   ', style: follow),
                      Text('${app.user.followersCount}', style: followCountDark),
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
                    drawerTile(context, 'assets/icons/profile.png', 'Profile'),
                    drawerTile(context, 'assets/icons/badge.png', 'Blue'),
                    drawerTile(context, 'assets/icons/bookmark.png', 'Bookmarks'),
                    drawerTile(context, 'assets/icons/list.png', 'Lists'),
                    drawerTile(context, 'assets/icons/audio.png', 'Spaces'),
                    drawerTile(context, 'assets/icons/money.png', 'Monetization'),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          const Divider(),
                          drawerTile2(context, 'assets/icons/rocket.png', 'For Professionals'),
                          drawerTile2(context, 'assets/icons/settings.png', 'Settings and privacy'),
                          drawerTile2(context, 'assets/icons/question.png', 'Help Centre')
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

  ListTile drawerTile(BuildContext context, iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white), title: Text(title, style: drawerTitleDark));
  ListTile drawerTile2(BuildContext context, iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, height: 20), title: Text(title, style: displayNameDark));
}