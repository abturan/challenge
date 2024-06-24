import 'package:flutter/material.dart';
import 'challenge_card.dart';

class ChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ChallengeCard(
          icon: Icons.fitness_center,
          category: 'Fitness',
          participants: 10,
          title: '100 Push-ups in 60 Seconds',
          description: 'Can you beat the record and win the 500 dollars prize?',
          prize: 500,
        ),
        ChallengeCard(
          icon: Icons.sports_basketball,
          category: 'Sports',
          participants: 15,
          title: 'Basketball Free Throw Challenge',
          description: 'Can you make 20 free throws in a row?',
          prize: 750,
        ),
        ChallengeCard(
          icon: Icons.lightbulb_outline,
          category: 'Creativity',
          participants: 8,
          title: 'Origami Masterpiece',
          description: 'Create the most intricate origami sculpture.',
          prize: 300,
        ),
        ChallengeCard(
          icon: Icons.code,
          category: 'Tech',
          participants: 12,
          title: 'Hackathon Challenge',
          description: 'Build the most innovative app in 24 hours.',
          prize: 1000,
        ),
      ],
    );
  }
}
