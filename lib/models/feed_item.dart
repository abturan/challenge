enum FeedItemType {
  challenge,
  ad,
  userActivity,
}

class FeedItem {
  final FeedItemType type;
  final Map<String, dynamic> data;

  FeedItem({required this.type, required this.data});
}
