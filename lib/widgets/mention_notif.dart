import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../themes/theme.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
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
                      child: Text(widget.app.notifications[widget.index].senderDisplayName, style: Theme.of(context).brightness == Brightness.light ? displayName : displayNameDark),
                    ),
                    Text('@${widget.app.notifications[widget.index].senderUserName} · ${widget.app.tweets[0].timeAgo}', style: userName)
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      const Text('Replying to ', style: userName,),
                      Text('@${widget.app.user.username}', style: notifTag)
                    ],
                  ),
                ),
                Text(widget.app.notifications[widget.index].content, style: Theme.of(context).brightness == Brightness.light ? tweetBody : tweetBodyDark),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/comment.png', scale: 1.5, color: Colors.grey),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].comments,
                              style: const TextStyle(
                                color: Colors.grey,
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
                              scale: 1.2,
                              color: retweeted ? Colors.green : Colors.grey,
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
                                color: Colors.grey,
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
                              scale: liked ? 2.0 : 1.2,
                              color: liked ? Colors.red : Colors.grey,
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
                                color: Colors.grey,
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
                            scale: 1.2,
                            color: Colors.grey
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              widget.app.tweets[widget.index].views,
                              style: const TextStyle(
                                color: Colors.grey,
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
                            size: 18.0,
                            color: Colors.grey,
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