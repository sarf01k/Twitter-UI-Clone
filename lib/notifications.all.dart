import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter/tweet.card.dart';

import 'providers.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return ListView.separated(
      itemCount: app.notifications.length,
      itemBuilder: (context, index) {
        return TweetCard(index: index);
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}