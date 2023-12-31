import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/follow_notif.dart';
import '../widgets/like_notif.dart';
import '../widgets/mention_notif.dart';
import '../widgets/new_post_notif.dart';
import '../widgets/reply_notif.dart';
import '../widgets/retweet_notif.dart';
import '../providers/providers.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return ListView.separated(
      itemCount: app.notifications.length,
      itemBuilder: (context, index) {
        if (app.notifications[index].type == NotificationType.postLike) {
          return LikeNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.reply) {
          return ReplyNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.retweet) {
          return RetweetNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.follow) {
          return FollowNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.newPost && app.notifications[index].isVerified) {
          return NewPostNotification(app: app, index: index);
        } else {
          return MentionNotification(app: app, index: index);
        }
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}