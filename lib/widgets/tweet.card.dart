import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/theme.dart';
import '../providers/providers.dart';

class TweetCard extends StatefulWidget {
  const TweetCard({super.key, required this.index});
  final int index;

  @override
  State<TweetCard> createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  bool liked = false;
  bool retweeted = false;
  @override
  Widget build(BuildContext context) {
    final app = context.read<App>();
    return Container(
      color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(app.tweets[widget.index].avatar),
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
                        app.tweets[widget.index].displayName,
                        style: Theme.of(context).brightness == Brightness.light ? displayName : displayNameDark,
                      ),
                    ),
                    Text(
                      '@${app.tweets[widget.index].username} · ${app.tweets[0].timeAgo}',
                      style: userName,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        size: 20.0,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(app.tweets[widget.index].text, overflow: TextOverflow.clip, style: Theme.of(context).brightness == Brightness.light ? tweetBody : tweetBodyDark)
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/comment.png', scale: 1.2, color: Colors.grey),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              app.tweets[widget.index].comments,
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
                              app.tweets[widget.index].retweets,
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
                              color: liked ? const Color(0xFFF9197F) : Colors.grey,
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
                              app.tweets[widget.index].likes,
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
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              app.tweets[widget.index].views,
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