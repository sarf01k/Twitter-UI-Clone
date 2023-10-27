import 'package:flutter/material.dart';
import 'providers.dart';
import 'theme.dart';

class FollowNotification extends StatelessWidget {

  const FollowNotification({
    super.key,
    required this.app, required this.index,
  });
  final int index;

  final App app;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Icon(Icons.person, size: 30, color: Color(0xFF1C9BF0)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(app.notifications[index].senderPfp)
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    children: [
                      Text(
                        app.notifications[index].senderDisplayName,
                        style: displayName,
                      ),
                      Text(' ${app.notifications[index].content}', style: tweetBody,)
                    ],
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