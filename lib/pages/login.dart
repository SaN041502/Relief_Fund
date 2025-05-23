import 'package:flutter/material.dart';
import 'package:relief_fund/pages/forgotpass.dart';
import 'package:relief_fund/widgets/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:relief_fund/widgets/notification.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const Loginpage({super.key, required this.showSignUpPage});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _mailcontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();

  Future<void> logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _mailcontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );

      if (context.mounted) {
        final notifier = AllNotification();
        await notifier.initNotification();
        await notifier.showNotification(
          title: "Login Successful",
          body: "Welcome back!",
        );

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    } catch (e) {
      // ignore: avoid_print
      print('Login error: $e');
      // Optionally show an error notification here
    }
  }

  @override
  void dispose() {
    _mailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            color: AppColors.backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Headlines
                Text(
                  'LogIn',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Login to get started',
                  style: TextStyle(fontSize: 15, color: AppColors.textColor),
                ),
                SizedBox(height: 20),

                //TextFields
                Row(
                  children: [
                    Text(
                      'Email:            ',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _mailcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 219, 218, 218),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'email@email.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Password:     ',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 219, 218, 218),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          hintText: 'ABcd123@#',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                //Forgot Password
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPassPage();
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 15,

                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),

                //LogInButton
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await logIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: AppColors.backgroundColor),
                  ),
                ),

                //LoginButton
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont't have an account? ------ ",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showSignUpPage,
                      child: Text(
                        'SignUp Now!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
