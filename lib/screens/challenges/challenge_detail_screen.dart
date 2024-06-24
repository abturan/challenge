import 'package:flutter/material.dart';
import 'package:cwtf_app/models/challenge_model.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/auth_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChallengeDetailScreen extends StatelessWidget {
  final ChallengeModel challenge;

  ChallengeDetailScreen({required this.challenge});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final isAuthenticated = authService.isAuthenticated;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '.wtf',
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 300.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/600/400'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 250.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      challenge.title,
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Challenge Type: Fitness',
                      style:
                          TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Description: A travel-based challenge where participants document their journey to a specific location, completing tasks along the way.',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.h),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildRewardCard('Total Points', '1000'),
                        _buildRewardCard('XP', '500'),
                        _buildRewardCard('WTF Crypto', '50'),
                        _buildRewardCard('NFT', 'Special Badge'),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'NFT Address:',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        'https://opensea.io/xyz123',
                        style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                      ),
                      onTap: () {
                        // NFT adresine yönlendir
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'NFT Contract Address:',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      child: Text(
                        'https://etherscan.io/address/abc456',
                        style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                      ),
                      onTap: () {
                        // NFT contract adresine yönlendir
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Participants: 150',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Start Date: 01/07/2024',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Duration: 30 days',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Requirements:',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '• Exercise at least 30 minutes a day.\n• Adopt healthy eating habits.\n• Submit weekly reports.',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Rules:',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '• If the rules are not followed, the challenge is considered failed.\n• No days without reports are accepted.\n• Motivate others.',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'FAQ:',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Q: How can I join this challenge?\nA: You can join by clicking the join button.',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: ElevatedButton(
          onPressed: () {
            if (isAuthenticated) {
              // Challenge'ı kabul etme işlemi
            } else {
              Navigator.pushNamed(context, '/authenticate');
            }
          },
          child: Text(
            'Accept Challenge',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRewardCard(String title, String value) {
    return Card(
      color: Colors.blueGrey[50],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 8.h),
            Text(
              value,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}