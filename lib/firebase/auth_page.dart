import 'package:flutter/material.dart';
import 'package:relief_fund/pages/login.dart';
import 'package:relief_fund/pages/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(showSignUpPage: toggleScreens);
    } else {
      return SignUpPage(showLogInPage: toggleScreens);
    }
  }
}
