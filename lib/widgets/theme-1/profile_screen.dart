import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          SizedBox(height: 20),
          Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFF1FAEE)),
          ),
          SizedBox(height: 10),
          Text(
            'john.doe@example.com',
            style: TextStyle(fontSize: 16, color: Color(0xFF234159)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFED174B),
              foregroundColor: Color(0xFFF1FAEE),
            ),
            onPressed: () {},
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}
