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
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1364344779685904387/1_8LtlJ2_400x400.jpg',
      username: 'pr_alphaa',
      displayName: 'ALPHA🥷🏻',
      timeAgo: '57m',
      text: 'Fastest weekend I\'ve seen ngl',
      comments: '243',
      retweets: '23K',
      likes: '112K',
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/994592419705274369/RLplF55e_400x400.jpg',
      username: 'MrBeast',
      displayName: 'Mr. Beast',
      timeAgo: '36m',
      text: 'I just got measured at 6’5. Why am I still getting taller in my 20s 😭',
      comments: '243',
      retweets: '23K',
      likes: '112K',
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1699794612284706816/TSeEIXud_400x400.jpg',
      username: 'CozyBrian_',
      displayName: 'Brian Joestar',
      timeAgo: '1h',
      text: 'Okay, look, I\'m honest\nGirl, i can\'t lie, I miss you',
      comments: '243',
      retweets: '23K',
      likes: '112K',
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1704985558571732992/mXW6pnbI_400x400.jpg',
      username: 'Selah',
      displayName: 'hoesmadfbg',
      timeAgo: '2m',
      text: 'every company in this country is so unserious. telcos, ecg, ghana water, fire service, police, everybody. ah',
      comments: '243',
      retweets: '23K',
      likes: '112K',
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1620474361336438800/bkZoDziE_400x400.jpg',
      username: 'meetwinnerr',
      displayName: 'Winner',
      timeAgo: '6m',
      text: 'Currently using GetX',
      comments: '243',
      retweets: '23K',
      likes: '112K',
    ),
  ];
}