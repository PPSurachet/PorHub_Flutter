import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:porhub_flutter/porhub.dart';
import 'package:porhub_flutter/views/login/signin.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User>();
    if (FirebaseUser != null) return PorHub();
    return SignInPage();
  }
}
