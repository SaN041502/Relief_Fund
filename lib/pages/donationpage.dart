import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relief_fund/pages/contact.dart';
import 'package:relief_fund/pages/homepage.dart';
import 'package:relief_fund/widgets/banner.dart';
import 'package:relief_fund/widgets/colors.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Relief Aid',
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back, color: AppColors.backgroundColor),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => _openCustomDrawer(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomBanner(
                imagePath: 'assets/images/image2.jpg',
                titles: 'Donte to Flood Affected People!',
              ),
              SizedBox(height: 10),
              CustomBanner(
                imagePath: 'assets/images/homeless.jpg',
                titles: 'Donte to Help Homeless People!',
              ),
              SizedBox(height: 10),
              CustomBanner(
                imagePath: 'assets/images/medical.jpeg',
                titles: 'Medical Aid for the Poor!',
              ),
              SizedBox(height: 10),
              CustomBanner(
                imagePath: 'assets/images/edu.jpg',
                titles: 'Education Aid for Children!',
              ),
              SizedBox(height: 10),
              CustomBanner(
                imagePath: 'assets/images/fire.jpg',
                titles: 'Donte to Fire Accident Victims!',
              ),
              SizedBox(height: 10),
              CustomBanner(
                imagePath: 'assets/images/drought.jpg',
                titles: 'Donte for Drought Relief!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//custom drawer
void _openCustomDrawer(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Align(
        alignment: Alignment.topRight,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  GestureDetector(
                    onTap:
                        () => showDialog(
                          context: context,
                          builder: (context) => Contact(),
                        ),
                    child: Row(
                      children: [
                        Icon(Icons.history, color: AppColors.textColor),
                        SizedBox(width: 20),
                        Text(
                          'History',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      FirebaseAuth.instance.signOut();
                    },

                    child: Row(
                      children: [
                        Icon(Icons.info, color: AppColors.textColor),
                        SizedBox(width: 20),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
