enum FeedItemType { challenge, ad, userActivity }

class FeedItem {
  final FeedItemType type;
  final dynamic data;

  FeedItem({required this.type, required this.data});
}
