import 'package:flutter/material.dart';

import '../providers/providers.dart';
import '../themes/theme.dart';

class RetweetNotification extends StatelessWidget {

  const RetweetNotification({
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
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Image.asset('assets/icons/retweet.png', scale: .9, color: Colors.green),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(app.notifications[index].senderPfp)
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Text(app.notifications[index].senderDisplayName, style: Theme.of(context).brightness == Brightness.light ? displayName : displayNameDark),
                      Text(' reposted your reply', style: Theme.of(context).brightness == Brightness.light ? tweetBody : tweetBodyDark)
                    ],
                  ),
                ),
                Text(app.notifications[index].content,style: userName)
              ],
            ),
          ),
        ],
      ),
    );
  }
}