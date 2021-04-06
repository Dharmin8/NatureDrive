import 'package:flutter/material.dart';
import 'login.dart';
import 'authentication.dart';

class MappingPage extends StatefulWidget {
  final AuthImplementation auth;

  MappingPage({required this.auth});

  State<StatefulWidget> createState() {
    return _MappingPageState();
  }
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _MappingPageState extends State<MappingPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    super.initState();
    String firebaseUserId = widget.auth.getCurrentUser();
    setState(() {
      authStatus =
          firebaseUserId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return new LoginPage(
          auth: widget.auth,
          onSignedOut: _signOut, onSignedIn: () { },
        );
    }
  }
}