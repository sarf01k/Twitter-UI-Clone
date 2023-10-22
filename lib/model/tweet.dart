class Tweet {
  final String avatar;
  final String username;
  final String displayName;
  final String timeAgo;
  final String text;
  final String comments;
  final String retweets;
  final String likes;

  Tweet({
    required this.avatar,
    required this.username,
    required this.displayName,
    required this.timeAgo,
    required this.text,
    required this.comments,
    required this.retweets,
    required this.likes,
  });
}