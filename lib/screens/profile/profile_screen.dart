import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cwtf_app/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('This is the profile screen'),
      ),
    );
  }
}


// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//     final user = authService.user;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: user == null
//           ? Center(child: Text('No user information'))
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: <Widget>[
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: NetworkImage(user.profilePictureUrl),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     user.name,
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     user.email,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }