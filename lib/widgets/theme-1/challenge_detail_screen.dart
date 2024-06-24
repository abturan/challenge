// lib/screens/challenges/challenge_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:cwtf_app/models/challenge_model.dart';

class ChallengeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map? ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title'] ?? 'Challenge Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(arguments['icon'] ?? Icons.category, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  arguments['category'] ?? 'Category',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              arguments['title'] ?? 'Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(arguments['description'] ?? 'Description'),
            SizedBox(height: 16),
            Text('${arguments['participants'] ?? 0} participants'),
            SizedBox(height: 16),
            Text('Prize: \$${arguments['prize'] ?? 0}'),
          ],
        ),
      ),
    );
  }
}
