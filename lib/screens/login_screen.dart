import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_dz/auth/auth_services.dart';
import 'package:social_dz/auth/google_services.dart';
import 'package:social_dz/components/google.dart';
import 'package:social_dz/components/mybutton.dart';
import 'package:social_dz/components/mytext.dart';
import 'package:social_dz/components/mytextfield.dart';
import 'package:social_dz/screens/forgot_password_screen.dart';
import 'package:social_dz/screens/home_screen.dart';
import 'package:social_dz/theme/theme_provider.dart';

import '../components/facebook.dart' show Facebook;

class LoginScreen extends StatefulWidget {
  final VoidCallback onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future signin() async {
    // Show loading circle while attempting to sign in
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    // Attempt to sign in with the provided credentials
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      if (!mounted) return;
      // Dismiss the loading dialog
      Navigator.of(context).pop();

      //show the success message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login Success')));
    } on FirebaseAuthException catch (e) {
      // Ensure the widget is mounted before updating UI
      if (!mounted) return;
      Navigator.of(context).pop(); // Dismiss the loading dialog

      // Handle specific FirebaseAuth errors
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found for that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many attempts. Please try again later.';
          break;
        case 'network-request-failed':
          errorMessage = 'Network error. Please check your connection.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
      }

      // Show dialog with the specific error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed:
                    () => Navigator.of(context).pop(), // Close the dialog
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the tree.
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 100),
                  SizedBox(height: 20),
                  Mytext(
                    text: "Welcome in Social dz",
                    color: colors.onPrimary,
                    size: 35,
                    isFight: true,
                  ),
                  SizedBox(height: 30),
                  Mytextfield(
                    controller: email,
                    hinttext: "Email",
                    color: Color(0xFFE0E0E0),
                    suffixicon: Icon(Icons.email),
                    obsecurtext: false,
                  ),
                  SizedBox(height: 10),
                  Mytextfield(
                    controller: password,
                    hinttext: "Password",
                    color: Color(0xFFE0E0E0),
                    suffixicon: Icon(Icons.password),
                    obsecurtext: true,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Mytext(
                            text: "Forgot Password?",
                            color: colors.secondary,
                            size: 15,
                            isFight: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Mybutton(onTap: signin, text: 'Sign In'),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: theme.dividerColor,
                          ),
                        ),
                        Mytext(
                          text: " OR Sign In with ",
                          color: colors.secondary,
                          size: 17,
                          isFight: true,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: theme.dividerColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Google(
                    imagepath: "assets/images/google.png",
                    onTap: () => GoogleServices().signInWithGoogle(),
                    text: "Sign In with google",
                    color: Colors.black,
                  ),
                  SizedBox(height: 30),
                  Facebook(
                    imagepath: "assets/images/facebook.png",
                    onTap: signin,
                    text: "Sign In with Facebook",
                  ),
                  SizedBox(height: 25),
                  Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Mytext(
                        text: "Don`t have an account? ",
                        color: colors.onSurface,
                        size: 15,
                        isFight: false,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Mytext(
                          text: "Register",
                          color: colors.secondaryContainer,
                          size: 15,
                          isFight: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
