import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/user.dart';
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfilePic(),
                      Icon(Icons.menu)
                    ]
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(app.user.displayName),
                        Text('@' + app.user.username),
                      ],
                    )
                  ),
                  Row(
                    children: [
                      Text(app.user.followingCount.toString() + ' Following   ' + app.user.followersCount.toString() + ' Followers'),
                    ],
                  )
                ]
              )
            ),
            const Divider(color: Colors.black, height: 0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  children:  <Widget>[
                    const ListTile(leading: Icon(Icons.person_outline), title: Text('Profile')),
                    const ListTile(leading: Icon(Icons.check), title: Text('Blue')),
                    const ListTile(leading: Icon(Icons.bookmark_outline), title: Text('Bookmarks')),
                    const ListTile(leading: Icon(Icons.list_alt), title: Text('Lists')),
                    const ListTile(leading: Icon(Icons.mic_outlined), title: Text('Spaces')),
                    const ListTile(leading: Icon(Icons.monetization_on_outlined), title: Text('Monetization')),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        child: const Column(
                          children: <Widget>[
                            Divider(color: Colors.black),
                            ListTile(leading: Icon(Icons.rocket_launch_outlined),title: Text('For Professionals')),
                            ListTile(leading: Icon(Icons.settings_outlined),title: Text('Settings')),
                            ListTile(leading: Icon(Icons.help_outline),title: Text('Help and Feedback'))
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
}