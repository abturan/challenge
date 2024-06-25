import 'package:flutter/material.dart';
import 'challenge_detail_screen.dart';
import 'package:cwtf_app/models/challenge_model.dart';

class ChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;

  ChallengeCard({required this.challenge});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeDetailScreen(challenge: challenge),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(challenge.type == ChallengeType.fitness ? Icons.fitness_center : Icons.extension, size: 40, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    challenge.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                challenge.description,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              Text('${challenge.participants} participants'),
              SizedBox(height: 10),
              Text('\$${challenge.prize} prize'),
            ],
          ),
        ),
      ),
    );
  }
}
