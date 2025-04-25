import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relief_fund/pages/donationpage.dart';
import 'package:relief_fund/pages/homepage.dart';
import 'package:relief_fund/pages/login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _loginPageOpened = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        _openLoginPage();
      }
    });
  }

  void _openLoginPage() {
    if (!_loginPageOpened) {
      _loginPageOpened = true;
      showModalBottomSheet(
        context: context,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        builder: (ctx) => Loginpage(),
      ).whenComplete(() {
        _loginPageOpened = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DonationPage();
          } else {
            return Homepage();
          }
        },
      ),
    );
  }
}
