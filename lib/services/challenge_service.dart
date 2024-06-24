import 'package:flutter/material.dart';
import 'package:cwtf_app/models/challenge_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChallengeService with ChangeNotifier {
  List<ChallengeModel> _challenges = [];

  List<ChallengeModel> get challenges => _challenges;

  Future<void> fetchChallenges() async {
    final response = await http.get(Uri.parse('http://localhost:3000/api/challenges'));

    if (response.statusCode == 200) {
      final List<dynamic> challengeJson = json.decode(response.body);
      _challenges = challengeJson.map((json) => ChallengeModel.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load challenges');
    }
  }
}
