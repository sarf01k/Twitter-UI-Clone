import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Image.asset('assets/icons/like_filled.png', scale: 1.5, color: Colors.red),
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
                  child: Text(
                    '${app.notifications[index].senderDisplayName} liked your post ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  app.notifications[index].content,
                  // style: TextStyle(
                  //   color: Colors.grey,
                  // ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReplyNotification extends StatefulWidget {

  const ReplyNotification({
    super.key,
    required this.app, required this.index,
  });
  final int index;

  final App app;

  @override
  State<ReplyNotification> createState() => _ReplyNotificationState();
}

class _ReplyNotificationState extends State<ReplyNotification> {
  bool liked = false;
  bool retweeted = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.app.notifications[widget.index].senderPfp)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        widget.app.notifications[widget.index].senderDisplayName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '@${widget.app.notifications[widget.index].senderUserName} · ${widget.app.tweets[0].timeAgo}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Replying to @${widget.app.user.username}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  widget.app.notifications[widget.index].content,
                  // style: TextStyle(
                  //   color: Colors.grey,
                  // ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/comment.png', scale: 1.5),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].comments,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              'assets/icons/retweet.png',
                              scale: 1.5,
                              color: retweeted ? Colors.green : null,
                            ),
                            onTap: () {
                              setState(() {
                                retweeted = !retweeted;
                              });
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].retweets,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              liked ? 'assets/icons/like_filled.png' : 'assets/icons/like_outlined.png',
                              scale: liked ? 2.5 : 1.5,
                              color: liked ? Colors.red : null,
                            ),
                            onTap: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].likes,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/views.png',
                            scale: 1.5,
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].views,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            size: 16.0,
                            color: Colors.black45,
                          ),
                        ],
                      ),                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Icon(Icons.person, size: 30, color: Colors.blue),
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
                  child: Text(
                    app.notifications[index].senderDisplayName + app.notifications[index].content,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
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
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    app.notifications[index].content + app.notifications[index].senderDisplayName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
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
                  child: Text(
                    '${app.notifications[index].senderDisplayName} liked your reply',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  app.notifications[index].content,
                  // style: TextStyle(
                  //   color: Colors.grey,
                  // ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MentionNotification extends StatefulWidget {
  const MentionNotification({super.key, required this.app, required this.index,});
  final int index;
  final App app;
  @override
  State<MentionNotification> createState() => _MentionNotificationState();
}

class _MentionNotificationState extends State<MentionNotification> {
  bool liked = false;
  bool retweeted = false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.app.notifications[widget.index].senderPfp)
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        widget.app.notifications[widget.index].senderDisplayName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '@${widget.app.notifications[widget.index].senderUserName} · ${widget.app.tweets[0].timeAgo}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Replying to @${widget.app.user.username}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  widget.app.notifications[widget.index].content,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/comment.png', scale: 1.5),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].comments,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              'assets/icons/retweet.png',
                              scale: 1.5,
                              color: retweeted ? Colors.green : null,
                            ),
                            onTap: () {
                              setState(() {
                                retweeted = !retweeted;
                              });
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].retweets,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: Image.asset(
                              liked ? 'assets/icons/like_filled.png' : 'assets/icons/like_outlined.png',
                              scale: liked ? 2.5 : 1.5,
                              color: liked ? Colors.red : null,
                            ),
                            onTap: () {
                              setState(() {
                                liked = !liked;
                              });
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].likes,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/views.png',
                            scale: 1.5,
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].views,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            size: 16.0,
                            color: Colors.black45,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}