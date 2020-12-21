import 'package:flutter/material.dart';
import 'package:porhub_flutter/authentication/authenticate_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:porhub_flutter/porhub.dart';
import 'package:porhub_flutter/views/home/home_screen.dart';
import 'package:porhub_flutter/views/login/signin.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenicationService>(
          create: (_) => AuthenicationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenicationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User>();
    if (FirebaseUser != null) return PorHub();
    return SignInPage();
  }
}
