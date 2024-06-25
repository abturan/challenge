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
                image: NetworkImage(challenge.image),
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
                    Row(
                      children: [
                        Icon(Icons.fitness_center, color: Colors.grey[600]),
                        SizedBox(width: 8.w),
                        Text(
                          challenge.type.toString().split('.').last,
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                        ),
                        Spacer(),
                        Text(
                          '${challenge.participants} participants',
                          style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      challenge.description,
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
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            // Beğenme işlevi
                          },
                        ),
                        SizedBox(width: 16.w),
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {
                            // Yorum yapma işlevi
                          },
                        ),
                        SizedBox(width: 16.w),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            // Paylaşma işlevi
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Comments',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    _buildComment('User1', 'Great challenge!'),
                    _buildComment('User2', 'Looking forward to this!'),
                    _buildComment('User3', 'Let’s do this together!'),
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

  Widget _buildComment(String user, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'), // Örnek profil resmi
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(comment),
            ],
          ),
        ],
      ),
    );
  }
}
