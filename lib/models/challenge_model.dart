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

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      participants: json['participants'],
      prize: json['prize'],
      image: json['image'],
      type: ChallengeType.values.firstWhere((e) => e.toString() == 'ChallengeType.${json['type']}'),
    );
  }
}

enum ChallengeType {
  fitness,
  sports,
  creativity,
  tech,
}
