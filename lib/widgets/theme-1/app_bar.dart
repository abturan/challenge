import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  CustomAppBar({this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.cloud, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'BetsUp',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'GameFont'),
              ),
              Text(
                '.io',
                style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'GameFont'),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.emoji_events, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.extension, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ],
      ),
      elevation: 0,
      backgroundColor: Color(0xFF0A1C28),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
