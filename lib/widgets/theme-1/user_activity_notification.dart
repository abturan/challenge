// lib/widgets/theme-1/user_activity_notification.dart

import 'package:flutter/material.dart';

class UserActivityNotification extends StatelessWidget {
  final String activityText;
  final String avatarUrl;

  UserActivityNotification({
    required this.activityText,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                activityText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
