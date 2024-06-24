import 'package:flutter/material.dart';
import 'colors.dart';

class UserActivityNotification extends StatelessWidget {
  final String activityText;

  UserActivityNotification({required this.activityText});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          activityText,
          style: TextStyle(
            color: darkTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'GameFont',
          ),
        ),
      ),
    );
  }
}
