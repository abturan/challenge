
import 'package:flutter/material.dart';
import 'challenge_detail_screen.dart';
class ChallengeCard extends StatelessWidget {
  final IconData icon;
  final String category;
  final int participants;
  final String title;
  final String description;
  final int prize;

  // Assuming a radius value is already defined
  static const double borderRadius = 12.0;

  ChallengeCard({
    required this.icon,
    required this.category,
    required this.participants,
    required this.title,
    required this.description,
    required this.prize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChallengeDetailScreen(),
            settings: RouteSettings(
              arguments: {
                'icon': icon,
                'category': category,
                'participants': participants,
                'title': title,
                'description': description,
                'prize': prize,
              },
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 40, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    category,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(description),
              SizedBox(height: 10),
              Text('$participants participants'),
              SizedBox(height: 10),
              Text('\$$prize prize'),
            ],
          ),
        ),
      ),
    );
  }
}
