import 'package:flutter/material.dart';

import 'model/tweet.dart';
import 'model/user.dart';

class App extends ChangeNotifier {
  User user = User(username: 'sarf01k', displayName: 'isaac sarfo', profileImageURL: 'assets/images/pfp.jpg', followersCount: 54, followingCount: 201);

  var tweets = [
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg',
      username: 'Flutter',
      displayName: 'FlutterDev',
      timeAgo: '5m',
      text: 'Google’s UI toolkit to build apps for mobile, web, & desktop from a single codebase.',
      comments: '243',
      retweets: '23K',
      likes: '112K',
    )
  ];
}