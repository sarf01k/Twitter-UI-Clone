import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/follow_notif.dart';
import '../widgets/like_notif.dart';
import '../widgets/mention_notif.dart';
import '../widgets/new_post_notif.dart';
import '../providers/providers.dart';
import '../widgets/reply_notif.dart';
import '../widgets/retweet_notif.dart';

class VerifiedNotifications extends StatelessWidget {
  const VerifiedNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return ListView.separated(
      itemCount: app.notifications.length,
      itemBuilder: (context, index) {
        if (app.notifications[index].type == NotificationType.postLike && app.notifications[index].isVerified) {
          return LikeNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.reply && app.notifications[index].isVerified) {
          return ReplyNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.retweet && app.notifications[index].isVerified) {
          return RetweetNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.follow && app.notifications[index].isVerified) {
          return FollowNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.mention && app.notifications[index].isVerified) {
          return MentionNotification(app: app, index: index);
        } else if (app.notifications[index].type == NotificationType.newPost && app.notifications[index].isVerified) {
          return NewPostNotification(app: app, index: index);
        } else {
          return const SizedBox.shrink();
        }
      },
      separatorBuilder: (context, index) {
          return app.notifications[index].isVerified ? const Divider() : const SizedBox.shrink();
      },
    );
  }
}