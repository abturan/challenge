import 'package:flutter/material.dart';
import 'colors.dart';

class ChallengeCard extends StatelessWidget {
  final IconData icon;
  final String category;
  final int participants;
  final String title;
  final String description;
  final int prize;

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
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: primaryColor),
                SizedBox(width: 8),
                Text(category, style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold)),
                Spacer(),
                Text('$participants participants', style: TextStyle(color: mutedTextColor)),
              ],
            ),
            SizedBox(height: 16),
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: darkTextColor)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(color: darkTextColor)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$$prize', style: TextStyle(color: accentColor, fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
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
          ],
        ),
      ),
    );
  }
}
