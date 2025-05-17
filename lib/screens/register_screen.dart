import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_dz/auth/google_services.dart';
import 'package:social_dz/components/google.dart';
import 'package:social_dz/components/mybutton.dart';
import 'package:social_dz/components/mytext.dart';
import 'package:social_dz/components/mytextfield.dart';
import 'package:social_dz/theme/theme_provider.dart';

import '../components/facebook.dart' show Facebook;

class RegisterScreen extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterScreen({super.key, required this.onTap});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    fullName.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  // Function to handle user registration
  Future signUp() async {
    // Check if passwords match
    if (password.text.trim() != confirmPassword.text.trim()) {
      _showErrorDialog('Passwords do not match.');
      return;
    }

    // Check if the email is valid
    if (!RegExp(
      r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$",
    ).hasMatch(email.text.trim())) {
      _showErrorDialog('Invalid email format.');
      return;
    }

    // Show loading circle while attempting to register
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent dismissing the dialog by tapping outside
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      // Attempt to create a user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim(),
          );
      addUser(email.text, fullName.text);
      if (!mounted) return;
      // Dismiss the loading dialog
      Navigator.of(context).pop();

      // Show success message

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Registration Success')));
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      // Dismiss the loading dialog
      Navigator.of(context).pop();

      // Handle specific FirebaseAuth errors
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage =
              'The email address is already in use by another account.';
          break;
        case 'weak-password':
          errorMessage =
              'The password is too weak. Please choose a stronger password.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is badly formatted.';
          break;
        default:
          errorMessage = 'An unexpected error occurred. Please try again.';
      }

      // Show dialog with the specific error message
      _showErrorDialog(errorMessage);
    }
  }

  Future addUser(String email, String username) async {
    // Create a new user with the given email and username
    await FirebaseFirestore.instance.collection("users").add({
      'email': email.trim(),
      'fullName': fullName.text.trim(),
    });
  }

  // Function to show an error dialog with the provided message
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
                    controller: fullName,
                    hinttext: "Full Name",
                    color: Color(0xFFE0E0E0),
                    suffixicon: Icon(Icons.person),
                    obsecurtext: false,
                  ),
                  SizedBox(height: 10),
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
                  Mytextfield(
                    controller: confirmPassword,
                    hinttext: "Confirm Password",
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
                        Mytext(
                          text: "Forgot Password?",
                          color: colors.secondary,
                          size: 15,
                          isFight: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Mybutton(onTap: signUp, text: 'Sign Up'),
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
                    onTap: signUp,
                    text: "Sign In with Facebook",
                  ),
                  SizedBox(height: 20),
                  Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Mytext(
                        text: "Already have an account? ",
                        color: colors.onSurface,
                        size: 15,
                        isFight: false,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Mytext(
                          text: "Login",
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
