import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifications.all.dart';
import 'providers.dart';

class MentionNotifications extends StatefulWidget {
  const MentionNotifications({super.key});

  @override
  State<MentionNotifications> createState() => _MentionNotificationsState();
}

class _MentionNotificationsState extends State<MentionNotifications> {
  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return ListView.separated(
      itemCount: app.notifications.length,
      itemBuilder: (context, index) {
        if (app.notifications[index].type == NotificationType.mention) {
          return MentionNotification(app: app, index: index);
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