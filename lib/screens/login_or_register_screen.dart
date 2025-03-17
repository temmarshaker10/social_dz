import 'package:flutter/material.dart';
import 'package:social_dz/screens/login_screen.dart';
import 'package:social_dz/screens/register_screen.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({super.key});

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool showLogin = true;

  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 600), // مدة الانتقال
        transitionBuilder: (child, animation) {
          // تأثير التلاشي
          // return FadeTransition(opacity: animation, child: child);

          // تأثير الانزلاق (إذا كنت تفضله بدل التلاشي)

          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0), // يبدأ من خارج الشاشة
              end: Offset.zero, // ينتهي في مكانه الطبيعي
            ).animate(animation),
            child: child,
          );
        },
        child:
            showLogin
                ? LoginScreen(onTap: togglePage, key: ValueKey(1))
                : RegisterScreen(onTap: togglePage, key: ValueKey(2)),
      ),
    );
  }
}
