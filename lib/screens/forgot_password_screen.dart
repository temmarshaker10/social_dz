import 'package:flutter/material.dart';
import 'package:social_dz/components/mybutton.dart';
import 'package:social_dz/components/mytext.dart';
import 'package:social_dz/components/mytextfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController email = TextEditingController();

  Future<dynamic>? resetPassword() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Mytext(
              text: "Enter your email to reset your password",
              color: colors.secondary,
              size: 20,
              isFight: true,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Mytextfield(
                hinttext: "Email",
                color: Color(0xFFE0E0E0),
                suffixicon: Icon(Icons.email),
                obsecurtext: false,
                controller: email,
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Mybutton(onTap: resetPassword, text: 'Rest Password'),
            ),
          ],
        ),
      ),
    );
  }
}
