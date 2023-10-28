import 'package:flutter/material.dart';

import 'providers.dart';
import 'theme.dart';

class NewPostNotification extends StatelessWidget {

  const NewPostNotification({
    super.key,
    required this.app, required this.index,
  });
  final int index;

  final App app;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/icons/notif_filled.png', scale: 1, color: Colors.blue),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(app.notifications[index].senderPfp)
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  child: RichText(
                    text: TextSpan(
                      text: app.notifications[index].content,
                      style: Theme.of(context).brightness == Brightness.light ? tweetBody : tweetBodyDark,
                      children: [
                        TextSpan(
                          text: ' ${app.notifications[index].senderDisplayName}',
                          style: Theme.of(context).brightness == Brightness.light ? displayName : displayNameDark,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}