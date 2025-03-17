import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  Future<dynamic>? signin() {}
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
                  Mybutton(onTap: signin, text: 'Sign Up'),
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
                    onTap: signin,
                    text: "Sign In with google",
                    color: Colors.black,
                  ),
                  SizedBox(height: 30),
                  Facebook(
                    imagepath: "assets/images/facebook.png",
                    onTap: signin,
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
