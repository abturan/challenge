// lib/widgets/theme-1/home_screen.dart

import 'package:flutter/material.dart';
import 'challenge_card.dart';
import 'ad_banner.dart';
import 'user_activity_notification.dart';
import 'feed_item.dart';
import 'colors.dart';

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
          return Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/600x300'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, backgroundColor.withOpacity(0.8)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bet on the Impossible: Win Big or Go Home!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: lightTextColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Join the latest challenges and compete for amazing prizes. Are you up for the challenge?',
                    style: TextStyle(fontSize: 16, color: lightTextColor),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      foregroundColor: lightTextColor,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Join Challenge'),
                  ),
                ],
              ),
            ),
          );
        }

        final item = feedItems[index - 1]; // Adjust index for feed items
        switch (item.type) {
          case FeedItemType.challenge:
            return ChallengeCard(
              icon: item.data['icon'],
              category: item.data['category'],
              participants: item.data['participants'],
              title: item.data['title'],
              description: item.data['description'],
              prize: item.data['prize'],
            );
          case FeedItemType.ad:
            return AdBanner(
              imageUrl: item.data['imageUrl'],
              adText: item.data['adText'],
            );
          case FeedItemType.userActivity:
            return UserActivityNotification(
              activityText: item.data['activityText'],
            );
        }
      },
    );
  }
}

List<FeedItem> generateFeedItems() {
  List<FeedItem> items = [];
  int challengeCount = 0;
  int adCount = 0;
  int userActivityCount = 0;

  // Sample data
  final challenges = [
    {
      'icon': Icons.fitness_center,
      'category': 'Fitness',
      'participants': 10,
      'title': '100 Push-ups in 60 Seconds',
      'description': 'Can you beat the record and win the 500 dollars prize?',
      'prize': 500,
    },
    {
      'icon': Icons.sports_basketball,
      'category': 'Sports',
      'participants': 15,
      'title': 'Basketball Free Throw Challenge',
      'description': 'Can you make 20 free throws in a row?',
      'prize': 750,
    },
    {
      'icon': Icons.lightbulb_outline,
      'category': 'Creativity',
      'participants': 8,
      'title': 'Origami Masterpiece',
      'description': 'Create the most intricate origami sculpture.',
      'prize': 300,
    },
    {
      'icon': Icons.code,
      'category': 'Tech',
      'participants': 12,
      'title': 'Hackathon Challenge',
      'description': 'Build the most innovative app in 24 hours.',
      'prize': 1000,
    },
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
    {'activityText': 'User John completed the 100 Push-ups in 60 Seconds challenge!'},
    {'activityText': 'User Jane won the Basketball Free Throw Challenge!'},
    {'activityText': 'User Bob joined the Hackathon Challenge!'},
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
