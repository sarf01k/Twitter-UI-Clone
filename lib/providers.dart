import 'package:flutter/material.dart';
import 'model/notification.dart';
import 'model/tweet.dart';
import 'model/user.dart';

enum NotificationType { postLike, repostLike, reply, mention, follow, retweet, newPost }

class App extends ChangeNotifier {
  User user = User(username: 'sarf01k', displayName: 'isaac sarfo', profileImageURL: 'assets/images/pfp.jpg', followersCount: 54, followingCount: 201);

  var tweets = [
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1557102284072538115/Ot9yxmKB_400x400.jpg',
      username: 'gyaigimii',
      displayName: 'KALYJAY',
      timeAgo: '27m',
      text: 'where he talk for 😂😂',
      comments: '243',
      retweets: '23K',
      likes: '112K',
      views: '345K'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1364344779685904387/1_8LtlJ2_400x400.jpg',
      username: 'pr_alphaa',
      displayName: 'ALPHA🥷🏻',
      timeAgo: '57m',
      text: 'Fastest weekend I\'ve seen ngl',
      comments: '2',
      retweets: '1',
      likes: '6',
      views: '87',
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/994592419705274369/RLplF55e_400x400.jpg',
      username: 'MrBeast',
      displayName: 'Mr. Beast',
      timeAgo: '36m',
      text: 'I just got measured at 6’5. Why am I still getting taller in my 20s 😭',
      comments: '1.5K',
      retweets: '21K',
      likes: '633K',
      views: '2.1M'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1699794612284706816/TSeEIXud_400x400.jpg',
      username: 'CozyBrian_',
      displayName: 'Brian Joestar',
      timeAgo: '1h',
      text: 'Okay, look, I\'m honest\nGirl, i can\'t lie, I miss you',
      comments: '0',
      retweets: '0',
      likes: '8',
      views: '112'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1704985558571732992/mXW6pnbI_400x400.jpg',
      username: 'hoesmadfbg',
      displayName: 'Selah',
      timeAgo: '2m',
      text: 'every company in this country is so unserious. telcos, ecg, ghana water, fire service, police, everybody. ah',
      comments: '1',
      retweets: '1',
      likes: '3',
      views: '45'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1620474361336438800/bkZoDziE_400x400.jpg',
      username: 'meetwinnerr',
      displayName: 'Winner',
      timeAgo: '6m',
      text: 'Currently using GetX',
      comments: '0',
      retweets: '0',
      likes: '2',
      views: '16'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1628772053175177217/EGVJXNqO_400x400.jpg',
      username: 'manifestive',
      displayName: 'M.anifest',
      timeAgo: '4h1h',
      text: 'Thousand times in a row I excel in every column',
      comments: '12',
      retweets: '4',
      likes: '23K',
      views: '31K'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1647987489439637509/ED9VLsDQ_400x400.jpg',
      username: 'ck_aboagye',
      displayName: 'CK',
      timeAgo: '6m',
      text: '우리의 희생이 헛되지 않기를 바랍니다',
      comments: '0',
      retweets: '1',
      likes: '2',
      views: '21'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1691458182005346304/3wd43r2y_400x400.jpg',
      username: 'Billyblxnco',
      displayName: 'Billyblxnco',
      timeAgo: '21h',
      text: 'switching off the bathroom light while your sibling is inside >>>',
      comments: '20',
      retweets: '7',
      likes: '893',
      views: '1.2K'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/728198940630384640/-NQMf0qy_400x400.jpg',
      username: 'THePunnyWorld',
      displayName: 'PUNS',
      timeAgo: '40m',
      text: 'My wife has banned me from making anymore breakfast puns.\n\nShe says if I make anymore, I’m toast.\n\nBut my kids keep egging me on.',
      comments: '56',
      retweets: '41',
      likes: '201K',
      views: '444K'
    ),
    Tweet(
      avatar: 'https://pbs.twimg.com/profile_images/1692982562279333890/2Mhh2rQ5_400x400.jpg',
      username: '0x7fff5fbff7c8',
      displayName: 'aglili👨🏻‍💻👨🏻‍🍳',
      timeAgo: '26m',
      text: 'since i completed this school i’ve been sooo free bro',
      comments: '5',
      retweets: '2',
      likes: '11',
      views: '34'
    )
  ];

  var notifications = [
    NotificationModel(
      type: NotificationType.retweet,
      content: 'abcddefghiklmno',
      senderDisplayName: 'sika',
      senderUserName: 'bigger',
      senderPfp: 'https://pbs.twimg.com/profile_images/1670171417994821632/JIz_3paa_400x400.jpg',
      isVerified: true
    ),
    NotificationModel(
      type: NotificationType.postLike,
      content: 'True😂😂',
      senderDisplayName: 'BigMan',
      senderUserName: 'abcd',
      senderPfp: 'https://pbs.twimg.com/profile_images/1691458182005346304/3wd43r2y_400x400.jpg',
      isVerified: false
    ),
    NotificationModel(
      type: NotificationType.reply,
      content: 'kwashia',
      senderDisplayName: 'Kofi',
      senderUserName: 'efgh',
      senderPfp: 'https://pbs.twimg.com/profile_images/1556968506905616386/p9e0RNyh_400x400.jpg',
      isVerified: false
    ),
    NotificationModel(
      type: NotificationType.follow,
      content: ' followed you',
      senderDisplayName: 'wiiliam💀',
      senderUserName: 'ijkl',
      senderPfp: 'https://pbs.twimg.com/profile_images/1701344910480228352/SL8EQNma_400x400.jpg',
      isVerified: false
    ),
    NotificationModel(
      type: NotificationType.postLike,
      content: '😂😂',
      senderDisplayName: 'ALPHA🥷🏻',
      senderUserName: 'pr_alphaa',
      senderPfp: 'https://pbs.twimg.com/profile_images/1364344779685904387/1_8LtlJ2_400x400.jpg',
      isVerified: false
    ),
    NotificationModel(
      type: NotificationType.newPost,
      content: 'Recent post notifications for ',
      senderDisplayName: 'Marques Brownlee',
      senderUserName: 'MKBHD',
      senderPfp: 'https://pbs.twimg.com/profile_images/1468001914302390278/B_Xv_8gu_400x400.jpg',
      isVerified: true
    ),
    NotificationModel(
      type: NotificationType.mention,
      content: 'i was going',
      senderDisplayName: 'CoochieMonster🤡',
      senderUserName: 'bnyx',
      senderPfp: 'https://pbs.twimg.com/profile_images/1692982562279333890/2Mhh2rQ5_400x400.jpg',
      isVerified: true
    ),
    NotificationModel(
      type: NotificationType.mention,
      content: '100%',
      senderDisplayName: 'David',
      senderUserName: 'smallDave',
      senderPfp: 'https://pbs.twimg.com/profile_images/1408108631808040964/m0iXhjl2_400x400.jpg',
      isVerified: false
    ),
    NotificationModel(
      type: NotificationType.mention,
      content: 'maybe, he shouldn\'t have',
      senderDisplayName: 'Loofds',
      senderUserName: 'ziggxz',
      senderPfp: 'https://pbs.twimg.com/profile_images/1670171417994821632/JIz_3paa_400x400.jpg',
      isVerified: false
    ),
    NotificationModel(
      type: NotificationType.mention,
      content: 'fr??',
      senderDisplayName: 'Walter H. White',
      senderUserName: 'heisenberg',
      senderPfp: 'https://pbs.twimg.com/profile_images/1687466507805036544/yWT2-byu_400x400.jpg',
      isVerified: false
    ),
  ];
}