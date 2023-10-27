import 'package:flutter/material.dart';
import 'providers.dart';
import 'theme.dart';

class LikeNotification extends StatelessWidget {

  const LikeNotification({
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
            child: Image.asset('assets/icons/like_filled.png', scale: 1.5, color: Color(0xFFF9197F)),
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
                      Text(
                        app.notifications[index].senderDisplayName,
                        style: displayName,
                      ),
                      const Text(' liked your post', style: tweetBody)
                    ],
                  ),
                ),
                Text(app.notifications[index].content, style: userName)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
