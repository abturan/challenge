import 'package:flutter/material.dart';
import 'package:cwtf_app/models/challenge_model.dart';
import 'challenge_card.dart';

class ChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    return ListView(
      padding: EdgeInsets.all(16),
      children: challenges.map((challenge) {
        return ChallengeCard(challenge: challenge);
      }).toList(),
    );
  }
}
