import 'package:flutter/material.dart';
import 'package:cwtf_app/screens/authenticate/login.dart';
import 'package:cwtf_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  final bool showSignIn;

  Authenticate({this.showSignIn = true});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  @override
  void initState() {
    super.initState();
    showSignIn = widget.showSignIn;
  }

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? LoginScreen(toggleView: toggleView)
        : RegisterScreen(toggleView: toggleView);
  }
}