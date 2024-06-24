import 'package:flutter/material.dart';

class ChallengeModel {
  final String? id;
  final String title;
  final String description;
  final int participants;
  final int prize;
  final String image;
  final ChallengeType? type;

  ChallengeModel({
    this.id,
    required this.title,
    required this.description,
    required this.participants,
    required this.prize,
    required this.image,
    this.type,
  });
}

enum ChallengeType {
  fitness,
  sports,
  creativity,
  tech,
}
