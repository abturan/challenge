import 'package:flutter/material.dart';
import 'package:cwtf_app/widgets/custom_header.dart';
import 'package:cwtf_app/widgets/custom_footer.dart';

class RewardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.card_giftcard),
                title: Text('Reward ${index + 1}'),
                subtitle: Text('Details about reward ${index + 1}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
