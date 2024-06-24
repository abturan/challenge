import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/challenge_service.dart';
import 'package:cwtf_app/widgets/feed/feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _fetchChallenges();
  }

  Future<void> _fetchChallenges() async {
    final challengeService = Provider.of<ChallengeService>(context, listen: false);
    await challengeService.fetchChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return Feed();
  }
}
