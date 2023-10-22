class User {
  final String username;
  final String displayName;
  final String profileImageURL;
  final int followersCount;
  final int followingCount;

  User({
    required this.username,
    required this.displayName,
    required this.profileImageURL,
    required this.followersCount,
    required this.followingCount,
  });
}