import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relief_fund/firebase/auth_page.dart';
import 'package:relief_fund/pages/donationpage.dart';
import 'package:relief_fund/pages/homepage.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool _loginPageOpened = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        _openPage();
      }
    });
  }

  void _openPage() {
    if (!_loginPageOpened) {
      _loginPageOpened = true;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        builder: (ctx) => AuthPage(),
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
