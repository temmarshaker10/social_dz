import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_dz/screens/home_screen.dart';
import 'package:social_dz/screens/login_or_register_screen.dart';

class AuthServices extends StatefulWidget {
  const AuthServices({super.key});

  @override
  State<AuthServices> createState() => _AuthServicesState();
}

class _AuthServicesState extends State<AuthServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginOrRegisterScreen();
          }
        },
      ),
    );
  }
}
