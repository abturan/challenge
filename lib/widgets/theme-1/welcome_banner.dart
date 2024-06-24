// lib/widgets/theme-1/welcome_banner.dart

import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  final List<Map<String, String>> banners = [
    {
      'title': 'Bet on the Impossible',
      'subtitle': 'Win Big or Go Home!',
      'description': 'Join the latest challenges and compete for amazing prizes. Are you up for the challenge?',
      'buttonText': 'Join Challenge',
      'color': '#cc2936',
    },
    // {
    //   'title': 'Challenge Yourself',
    //   'subtitle': 'Achieve the Unthinkable!',
    //   'description': 'Take part in exciting new challenges and prove your mettle.',
    //   'buttonText': 'View Challenges',
    //   'color': '#ebbab9',
    // },
    // {
    //   'title': 'Get Rewarded',
    //   'subtitle': 'Earn Amazing Prizes!',
    //   'description': 'Participate and win rewards for completing challenges.',
    //   'buttonText': 'See Rewards',
    //   'color': '#2274a5',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          final color = Color(int.parse(banner['color']!.substring(1, 7), radix: 16) + 0xFF000000);

          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    banner['title']!,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'GameFont',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    banner['subtitle']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'GameFont',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    banner['description']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      fontFamily: 'GameFont',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: color,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(banner['buttonText']!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
