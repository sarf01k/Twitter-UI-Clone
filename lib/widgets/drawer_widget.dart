import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme.dart';
import 'pfp.dart';
import '../providers/providers.dart';

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
    final themeProvider = Provider.of<App>(context);
    final value = themeProvider.isDarkMode;
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
                          Text(app.user.displayName, style: Theme.of(context).brightness == Brightness.light ? displayName : displayNameDark),
                          Text('@${app.user.username}', style: userName),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${app.user.followingCount}', style: Theme.of(context).brightness == Brightness.light ? followCount : followCountDark),
                          const Text(' Following   ', style: follow),
                          Text('${app.user.followersCount}', style: Theme.of(context).brightness == Brightness.light ? followCount : followCountDark),
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
                  // Switch.adaptive(
                  //   value: themeProvider.isDarkMode,
                  //   onChanged: (value) {
                  //     final provider = Provider.of<App>(context, listen: false);
                  //     provider.toggleTheme(value);
                  //   }
                  // ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * .5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 30),
                                  child: Text('Dark mode', style: Theme.of(context).brightness == Brightness.light ? drawerTitle : drawerTitleDark),
                                ),
                                const Divider(thickness: 1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      bottomSheetTile(context, themeProvider, 'Off', false),
                                      bottomSheetTile(context, themeProvider, 'On', true),
                                      ListTile(
                                        title: Text('Use device settings', style: Theme.of(context).brightness == Brightness.light ? const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400) : const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
                                        trailing: Radio(
                                          activeColor: Colors.blue,
                                          value: true,
                                          groupValue: themeProvider.isDarkMode,
                                          onChanged: (value) {
                                            Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
                                            bool isDark = platformBrightness == Brightness.dark;

                                            themeProvider.toggleTheme(isDark);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(thickness: 1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Dark theme', style: Theme.of(context).brightness == Brightness.light ? drawerTitle : drawerTitleDark),
                                      bottomSheetTile(context, themeProvider, 'Dim', true),
                                      bottomSheetTile(context, themeProvider, 'Lights Out', true)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      );
                    },
                    icon: Theme.of(context).brightness == Brightness.light ? const Icon(Icons.light_mode_outlined, color: Colors.black) : const Icon(Icons.dark_mode_outlined, color: Colors.white),
                  ),
                ]
              )
            ),
          )
        ],
      ),
    );
  }

  ListTile bottomSheetTile(BuildContext context, App themeProvider, String title, isActive) {
    return ListTile(
      title: Text(title, style: Theme.of(context).brightness == Brightness.light ? const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400) : const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
      trailing: Radio(
        activeColor: Colors.blue,
        value: isActive,
        groupValue: themeProvider.isDarkMode,
        onChanged: (value) {
          themeProvider.toggleTheme(!themeProvider.isDarkMode);
        },
      ),
    );
  }

  ListTile drawerTile(BuildContext context, iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, scale: 1), title: Text(title, style: Theme.of(context).brightness == Brightness.light ? drawerTitle : drawerTitleDark));

  ListTile drawerTile2(BuildContext context, iconPath, title) => ListTile(leading: Image.asset(iconPath, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, scale: 1.3), title: Text(title, style: Theme.of(context).brightness == Brightness.light ? displayName : displayNameDark));
}