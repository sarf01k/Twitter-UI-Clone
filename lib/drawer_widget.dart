import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'pfp.dart';
import 'providers.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
      child: Stack(
        children: [
          Padding(
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height * .06,
              color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      app.toggleDarkMode(!app.isDark);
                    },
                    icon: Theme.of(context).brightness == Brightness.light ? Icon(Icons.light_mode_outlined, color: Colors.black) : Icon(Icons.dark_mode_outlined, color: Colors.white),
                  ),
                  // Image.asset('assets/icons/night-mode.png', scale: 1, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white)
                ]
              )
            ),
          )
        ],
      ),
    );
  }

  ListTile drawerTile(BuildContext context, iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, scale: 1), title: Text(title, style: drawerTitleDark));

  ListTile drawerTile2(BuildContext context, iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, scale: 1.3), title: Text(title, style: displayNameDark));
}