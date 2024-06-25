// lib/widgets/theme-1/home_screen.dart

import 'package:flutter/material.dart';
import 'challenge_card.dart';
import 'ad_banner.dart';
import 'user_activity_notification.dart';
import 'feed_item.dart';
import 'colors.dart';
import 'welcome_banner.dart';
import 'package:cwtf_app/models/challenge_model.dart';

class HomeScreen extends StatelessWidget {
  final List<FeedItem> feedItems = generateFeedItems();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: feedItems.length + 1, // +1 for the welcome banner
      itemBuilder: (context, index) {
        if (index == 0) {
          // Welcome banner at the top
          return WelcomeBanner();
        }

        final item = feedItems[index - 1]; // Adjust index for feed items
        switch (item.type) {
          case FeedItemType.challenge:
            return ChallengeCard(challenge: item.data);
          case FeedItemType.ad:
            return AdBanner(
              imageUrl: item.data['imageUrl'],
              adText: item.data['adText'],
              color: getAdBannerColor(index), // Assign background color
            );
          case FeedItemType.userActivity:
            return UserActivityNotification(
              activityText: item.data['activityText'],
              avatarUrl: item.data['avatarUrl'], // Pass avatar URL
            );
        }
      },
    );
  }
}

Color getAdBannerColor(int index) {
  List<Color> colors = [
    Color(0xFF32936F),
    Color(0xFF2274A5),
    Color(0xFFCC2936),
  ];
  return colors[index % colors.length];
}

List<FeedItem> generateFeedItems() {
  List<FeedItem> items = [];
  int challengeCount = 0;
  int adCount = 0;
  int userActivityCount = 0;

  // Sample data
  final challenges = [
    ChallengeModel(
      id: '1',
      title: '100 Push-ups in 60 Seconds',
      description: 'Can you beat the record and win the 500 dollars prize?',
      participants: 10,
      prize: 500,
      image: 'https://via.placeholder.com/150',
      type: ChallengeType.fitness,
    ),
    ChallengeModel(
      id: '2',
      title: 'Basketball Free Throw Challenge',
      description: 'Can you make 20 free throws in a row?',
      participants: 15,
      prize: 750,
      image: 'https://via.placeholder.com/150',
      type: ChallengeType.sports,
    ),
    ChallengeModel(
      id: '3',
      title: 'Origami Masterpiece',
      description: 'Create the most intricate origami sculpture.',
      participants: 8,
      prize: 300,
      image: 'https://via.placeholder.com/150',
      type: ChallengeType.creativity,
    ),
    ChallengeModel(
      id: '4',
      title: 'Hackathon Challenge',
      description: 'Build the most innovative app in 24 hours.',
      participants: 12,
      prize: 1000,
      image: 'https://via.placeholder.com/150',
      type: ChallengeType.tech,
    ),
  ];

  final ads = [
    {
      'imageUrl': 'https://example.com/ad1.jpg',
      'adText': 'Get 50% off on your next sports gear purchase! Use code BETSUP50.',
    },
    {
      'imageUrl': 'https://example.com/ad2.jpg',
      'adText': 'Join the ultimate gaming tournament and win exciting prizes! Register now.',
    },
    {
      'imageUrl': 'https://example.com/ad3.jpg',
      'adText': 'Discover the best health and fitness tips from our experts. Sign up for free.',
    },
  ];

  final userActivities = [
    {
      'activityText': 'User John completed the 100 Push-ups in 60 Seconds challenge!',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
    {
      'activityText': 'User Jane won the Basketball Free Throw Challenge!',
      'avatarUrl': 'https://randomuser.me/api/portraits/women/2.jpg',
    },
    {
      'activityText': 'User Bob joined the Hackathon Challenge!',
      'avatarUrl': 'https://randomuser.me/api/portraits/men/3.jpg',
    },
    {
      'activityText': 'User Alice mastered the Origami Masterpiece challenge!',
      'avatarUrl': 'https://randomuser.me/api/portraits/women/4.jpg',
    },
  ];

  int totalItems = challenges.length + ads.length + userActivities.length;

  for (int i = 0; i < totalItems; i++) {
    if (challengeCount < challenges.length) {
      items.add(FeedItem(type: FeedItemType.challenge, data: challenges[challengeCount]));
      challengeCount++;
    }
    if ((i + 1) % 3 == 0 && adCount < ads.length) {
      items.add(FeedItem(type: FeedItemType.ad, data: ads[adCount]));
      adCount++;
    }
    if ((i + 1) % 4 == 0 && userActivityCount < userActivities.length) {
      items.add(FeedItem(type: FeedItemType.userActivity, data: userActivities[userActivityCount]));
      userActivityCount++;
    }
  }

  return items;
}
