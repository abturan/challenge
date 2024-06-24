import 'package:flutter/material.dart';
import 'package:cwtf_app/widgets/custom_header.dart';
import 'package:cwtf_app/widgets/custom_footer.dart';

class RewardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(),
      body: Center(
        child: Text(
          'Rewards',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}
