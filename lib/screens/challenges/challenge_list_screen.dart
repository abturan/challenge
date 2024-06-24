import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/challenge_service.dart';
import 'package:cwtf_app/widgets/feed/challenge_card.dart';
import 'package:cwtf_app/screens/challenges/challenge_detail_screen.dart';

class ChallengeListScreen extends StatefulWidget {
  @override
  _ChallengeListScreenState createState() => _ChallengeListScreenState();
}

class _ChallengeListScreenState extends State<ChallengeListScreen> {
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
    final challengeService = Provider.of<ChallengeService>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: challengeService.challenges.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
              ),
              itemCount: challengeService.challenges.length,
              itemBuilder: (context, index) {
                final challenge = challengeService.challenges[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChallengeDetailScreen(challenge: challenge),
                      ),
                    );
                  },
                  child: ChallengeCard(challenge: challenge),
                );
              },
            ),
    );
  }
}
