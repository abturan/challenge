// lib/widgets/theme-1/ad_banner.dart

import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  final String imageUrl;
  final String adText;
  final Color color; // Color parameter added

  AdBanner({
    required this.imageUrl,
    required this.adText,
    required this.color, // Initialize color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color, // Apply color
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: color.withOpacity(0.7), // Apply semi-transparent overlay
        child: Text(
          adText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
