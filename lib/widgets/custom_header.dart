import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/auth_service.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final authService = Provider.of<AuthService>(context);
    final isAuthenticated = authService.isAuthenticated;

    return AppBar(
      backgroundColor: Colors.blueGrey[900],
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            Text(
              '.wtf',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                Icons.flash_on,
                size: 30,
                color: Colors.blue,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.whatshot,
                color: Colors.orange,
              ),
              SizedBox(width: 0),
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  if (isAuthenticated) {
                    Navigator.pushNamed(context, '/profile');
                  } else {
                    Navigator.pushNamed(context, '/authenticate');
                  }
                },
              ),
              SizedBox(width: 2),
            ],
          ),
        )
      ],
      centerTitle: false,
    );
  }

  @override
  double get maxExtent => kToolbarHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}