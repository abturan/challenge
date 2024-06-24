import 'package:flutter/material.dart';
import 'app_bar.dart';

class ChallengeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map? ?? {};

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF1FAEE),
                  borderRadius: BorderRadius.circular(12),
                ),
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
                        Icon(arguments['icon'] ?? Icons.category, color: Color(0xFF457B9D)),
                        SizedBox(width: 8),
                        Text(
                          arguments['category'] ?? 'Category',
                          style: TextStyle(
                            color: Color(0xFFED174B),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GameFont',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      arguments['title'] ?? 'Title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D3557),
                        fontFamily: 'GameFont',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      arguments['description'] ?? 'Description',
                      style: TextStyle(color: Color(0xFF457B9D)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '${arguments['participants'] ?? 0} participants',
                      style: TextStyle(color: Color(0xFF457B9D)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF1FAEE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Challenge Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1D3557),
                        fontFamily: 'GameFont',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Can you beat the record and win the 500 dollars prize? Join the latest challenges and compete for amazing prizes. Are you up for the challenge?',
                      style: TextStyle(color: Color(0xFF457B9D)),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '500 dollars',
                          style: TextStyle(
                            color: Color(0xFFED174B),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GameFont',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFED174B),
                            foregroundColor: Color(0xFFF1FAEE),
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
            ],
          ),
        ),
      ),
    );
  }
}
