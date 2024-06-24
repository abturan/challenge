import 'package:flutter/material.dart';
import 'colors.dart';

class AdBanner extends StatelessWidget {
  final String imageUrl;
  final String adText;

  AdBanner({
    required this.imageUrl,
    required this.adText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              adText,
              style: TextStyle(
                color: darkTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'GameFont',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
